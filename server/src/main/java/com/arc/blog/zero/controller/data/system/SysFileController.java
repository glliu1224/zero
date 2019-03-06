package com.arc.blog.zero.controller.data.system;

//import ch.qos.logback.core.util.FileUtil;

import com.arc.blog.model.domain.system.SysFile;
import com.arc.blog.model.vo.ResponseVo;
import com.arc.blog.utils.FileUtil;
import com.arc.blog.zero.service.system.SysFileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.*;

/**
 * 文件上传接口
 *
 * @author May
 * @since 2019/1/13 17:51
 */
@Slf4j
@RestController
@RequestMapping("/file")
public class SysFileController {

    @Resource
    private SysFileService sysFileService;

    @PostMapping("/upload/v1")
    public ResponseVo uploadV1(MultipartFile file) {
        String toDiskPath;
        //需求判断文件是否为空
        if (file == null || file.isEmpty()) {
            log.info("上传失败，文件或者路径为空！");
            return ResponseVo.failure("上传失败，文件或者路径为空！");
        }
        try {

            String targetDir = "C:\\Users\\X\\Desktop\\upload\\";
            String targetFileName = FileUtil.getTargetFileName(file.getOriginalFilename());
            targetFileName = targetDir + targetFileName;
            log.debug("带上路径的目标文件 targetFileName={}", targetFileName);
            toDiskPath = writeToDisk(file.getInputStream(), targetFileName);
        } catch (IOException e) {
            e.printStackTrace();
            log.error("异常={}", e);
            return null;
        }
        if (toDiskPath != null) {
            SysFile sysFile = new SysFile();
            String fileName = toDiskPath.substring(toDiskPath.lastIndexOf(File.separator) + 1);
            String fileSuffix = toDiskPath.substring(toDiskPath.lastIndexOf(FileUtil.EXTENSION_SEPARATOR) + 1);
            System.out.println("fileName-------->" + fileName);
            System.out.println("fileSuffix-------->" + fileSuffix);
            sysFile.setName(fileName);
            sysFile.setSuffix(fileSuffix);
            sysFile.setNote(toDiskPath);
            sysFile.setUrl(toDiskPath);
            sysFileService.save(sysFile);
        }

        return ResponseVo.success(toDiskPath);
    }


    @PostMapping("/upload/v2")
    public ResponseVo uploadFile2(MultipartFile file) {
        //对于文件做持久化操作
        //读取文件并解析

        //上传文件的问题
        //正常情况：变量名称，文件大小，文件格式，文件名称重复时候处理，文件在磁盘上的路径处理，文件路径记录到数据库，生成唯一编号
        //异常情况：文件为空判断，路径为空或者不合法判断，不支持的文件类型判断，文件重复判断，写入磁盘异常判断，写入磁盘成功，但是信息记录数据库出错，造成数据耗着磁盘，但是应用检索数据库时候并无法发现该文件， 需要做补偿来删除脏数据
        try {
            //注意此方法指向的是一个文件，而非文件夹
            file.transferTo(new File("C:\\Users\\X\\Desktop\\upload\\1"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ResponseVo.failure();

    }


    @PostMapping("/upload/v3")
    private ResponseVo writeFileToDisk(MultipartFile file, String path) {

        System.out.println(file == null);
        System.out.println(file.isEmpty());
        System.out.println(StringUtils.isEmpty(path));

//        if (file == null || file.isEmpty() || StringUtils.isEmpty(path)) {
//            log.info("上传失败，文件或者路径为空！");
//            return null;
//        }

        log.debug("文件上传入参: 名称={}，大小={} bytes， 类型={}", file.getOriginalFilename(), file.getSize(), file.getContentType());

        System.out.println("getName=" + file.getName());//file
        System.out.println("getResource=" + file.getResource());//MultipartFile resource [file]
        System.out.println("getContentType=" + file.getContentType());//application/vnd.openxmlformats-officedocument.wordprocessingml.document
        System.out.println("getOriginalFilename=" + file.getOriginalFilename());//记录.docx

        ////////////////////////////////
        //文件名称=原名称+时间戳

        //1 时间戳

        // 获取文件扩展名，即文件名称后缀
        String originalFilename = file.getOriginalFilename();
        String substring = "";
        if ((originalFilename != null) && (originalFilename.length() > 0)) {
            int dot = originalFilename.lastIndexOf('.');
            if ((dot > -1) && (dot < (originalFilename.length() - 1))) {
                substring = originalFilename.substring(dot + 1);
            }
        }


        //组合名称

        String savedFilename = originalFilename + System.currentTimeMillis() + substring;

        System.out.println("全名=" + originalFilename);
        System.out.println("后缀=" + substring);
        System.out.println("组合名称=" + savedFilename);


        //文件路径问题
        String fullPath = path + savedFilename;
        File saveFile = new File(fullPath);
        if (!saveFile.getParentFile().exists()) {
            log.info("目标路径{}不存在，新建此路径", fullPath);
            if (!saveFile.getParentFile().mkdirs()) {
                log.info("文件路径{}创建失败！", fullPath);
            }
        }

        log.debug("getAbsolutePath保存路径: " + saveFile.getAbsolutePath());
        log.debug("getPath=" + saveFile.getPath());
        log.debug("isFile=" + saveFile.isFile());
        log.debug("getParent=" + saveFile.getParent());
        log.debug("getParent=" + saveFile.getParentFile());
        // 覆盖原文件
//        if (saveFile.exists()) {
//            FileUtil.delete(fullPath);
//        }
        try {
            File targetFile = new File(path);
            log.debug("toPath={}", targetFile.toPath());
            log.debug("结果={}", targetFile.toPath());
            log.debug("结果={}", targetFile.toPath());
//            int copy = copy(file.getInputStream(), Files.newOutputStream(targetFile.toPath()));
//            log.debug("结果={}", copy);
            return ResponseVo.success(fullPath);
        } catch (Exception e) {
            log.error("文件上传失败！", e);
            return ResponseVo.failure();
        }
    }


    ////////////////////////////////////////////////////////////////////////////////////////
//todo 方法抽取
    public static String writeToDisk(InputStream inputStream, String outDir) {

        OutputStream outputStream = null;
        try {
            Assert.notNull(outDir, "No OutputStream specified");
            File outFile = new File(outDir);
            log.debug("结果outFile.exists={}", outFile.exists());
            if (!outFile.exists()) {
                boolean mkdirs = outFile.getParentFile().mkdirs();
                log.debug("父级文件夹{}，创建是否成功：{}", outFile.getParent(), mkdirs);
                boolean newFile = outFile.createNewFile();
                log.debug("文件写入文件夹{}，是否成功：{}", outFile.getParent(), newFile);
            }
            outputStream = new FileOutputStream(outFile);
            Assert.notNull(inputStream, "No InputStream specified");
            Assert.notNull(outFile, "No OutputStream specified");
            int byteCount = 0;
            byte[] buffer = new byte[4096];
            int bytesRead;
            for (boolean var4 = true; (bytesRead = inputStream.read(buffer)) != -1; byteCount += bytesRead) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            if (outputStream != null) {
                try {
                    outputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    log.error(" OutputStream close出错", e);
                }
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    log.error(" OutputStream close出错", e);
                }
            }
        }
        return outDir;
    }


    public static void main(String[] args) {
        try {
            test();
//            test2();
            String from = "C:\\Users\\X\\Desktop\\123.jpg";
            String out = "C:\\Users\\X\\Desktop\\upload\\234.jpg";

            File fromFile = new File(from);
            File outFile = new File(out);

            InputStream inputStream = new FileInputStream(fromFile);

            OutputStream outputStream = new FileOutputStream(outFile);

            Assert.notNull(inputStream, "No InputStream specified");
            Assert.notNull(outFile, "No OutputStream specified");

            int byteCount = 0;
            byte[] buffer = new byte[4096];

            int bytesRead;
            for (boolean var4 = true; (bytesRead = inputStream.read(buffer)) != -1; byteCount += bytesRead) {
                outputStream.write(buffer, 0, bytesRead);
            }

            outputStream.flush();


        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void test() throws IOException {
        //            String data = " This content will append to the end of the file";
        String targetDir = "C:\\Users\\X\\Desktop\\upload\\target.txt";

        File file = new File("C:\\Users\\X\\Desktop\\upload\\test.txt");
        File target = new File(targetDir);
        if (!target.exists()) {
            boolean newFile = target.createNewFile();
            System.out.println(newFile);
        }


        //if file doesnt exists, then create it
        if (!file.exists()) {
            file.createNewFile();
        }

        //true = append file
        FileWriter fileWriter = new FileWriter(file.getName(), true);
        BufferedWriter bufferedWriter = new BufferedWriter(fileWriter);
        bufferedWriter.write(targetDir);
        bufferedWriter.close();

        System.out.println("Done");
    }

    public static void test2() throws IOException {
        String file = "C:\\Users\\X\\Desktop\\from.txt";

        String charSet = "UTF-8";
        //写字符转换成字节流
        FileOutputStream fileWriter = new FileOutputStream(file);
        try (OutputStreamWriter writer = new OutputStreamWriter(fileWriter, charSet);
        ) {
            writer.write("测试输入字符串1");
        } catch (Exception e) {
            // TODO: handle exception
        }
        //读取字节转换到字符
        FileInputStream fileInputStream = new FileInputStream(file);
        StringBuilder builder = new StringBuilder();
        char[] buf = new char[64];
        int count;
        try (InputStreamReader reader = new InputStreamReader(fileInputStream, charSet);
        ) {
            while ((count = reader.read(buf)) != -1) {
                builder.append(buf, 0, count);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        log.debug("builder.toString()结果={}", builder.toString());
    }
}
