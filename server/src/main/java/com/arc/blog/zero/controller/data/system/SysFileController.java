package com.arc.blog.zero.controller.data.system;

//import ch.qos.logback.core.util.FileUtil;

import com.arc.blog.model.domain.system.SysFile;
import com.arc.blog.model.vo.ResponseVo;
import com.arc.blog.utils.FileUtil;
import com.arc.blog.zero.service.system.SysFileService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.*;
import java.util.Date;
import java.util.UUID;

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
    private SysFileService fileService;

    /**
     * 临时目录，注意你电脑上是否有该目录
     */
    private String tempDir = "C:\\Users\\X\\Desktop\\UP\\A\\";


    /**
     * 单文件上传
     *
     * @param file
     * @return
     */
    @PostMapping("/upload")
//    public ResponseVo singleFileUpload(@RequestPart(value = "file") MultipartFile file) throws IOException {
    public ResponseVo singleFileUpload(MultipartFile file) throws IOException {

        System.out.println("getName=" + file.getName());//file
        System.out.println("getResource=" + file.getResource());//MultipartFile resource [file]
        System.out.println("getContentType=" + file.getContentType());//application/vnd.openxmlformats-officedocument.wordprocessingml.document
        System.out.println("getOriginalFilename=" + file.getOriginalFilename());//记录.docx

        ////////////////////////////////
        //文件名称=原名称+时间戳


        //需求判断文件是否为空
        if (file == null || file.isEmpty()) {
            log.info("上传失败，文件或者路径为空！");
            return ResponseVo.failure("上传失败，文件或者路径为空！");
        }

        log.debug("文件上传入参: 类型={}，名称={}，尺寸={} bytes", file.getContentType(), file.getOriginalFilename(), file.getSize());
        //记录日志
        //判合法性，非空，大小，格式
        //1、文件写入磁盘,注意文件不会被覆盖，因为不存在同名文件
        //2、描述信息记录数据库


        //文件落地--文件名称 文路径
        String targetFileName = FileUtil.getTargetFileName(file.getOriginalFilename());

//        tempDir
        File outFile = new File(tempDir);
        //存在该文件夹吗？
        //是文件夹吗？

        if (!outFile.exists()) {
//            boolean mkdir() :  创建此抽象路径名指定的目录。 父级路径若不存在则不会创建该目录。
//            boolean mkdirs() :  创建此抽象路径名指定的目录，包括创建必需但不存在的父目录。父级路径若不存在则会创建该目录。
            boolean mkdirs = outFile.mkdirs();
            if (!mkdirs) {
                throw new RuntimeException("文件夹不存在，并创建失败，文件终止保存");
            }
        }

        //getAbsolutePath()  方法去除了干扰   ./   ../
        String writeFile = outFile.getAbsolutePath() + "\\" + targetFileName;
        String toDiskPath = writeToDisk(file.getInputStream(), writeFile);
        System.out.println(writeFile.equals(toDiskPath));
        System.out.println(writeFile.equals(toDiskPath));
        System.out.println(writeFile.equals(toDiskPath));
        if (toDiskPath != null) {
            //描述信息记录数据库
            SysFile sysFile = createSysFile(file, toDiskPath);
            return ResponseVo.success(fileService.save(sysFile));
        }
        return ResponseVo.failure();
    }

    /**
     * 构建可入库的数据
     *
     * @param file
     * @param toDiskPath
     * @return
     */
    private SysFile createSysFile(MultipartFile file, String toDiskPath) {
        SysFile sysFile = new SysFile();
        //全名
        String originalFilename = file.getOriginalFilename();

        sysFile.setName(originalFilename);
        sysFile.setNote("文件上传");
        String suffix = "";
        int lastIndexOf = originalFilename.lastIndexOf(".");
        if (lastIndexOf != -1) {
            suffix = originalFilename.substring(lastIndexOf + 1, originalFilename.length());
        }
        sysFile.setSuffix(suffix);
        sysFile.setSize(file.getSize());
        sysFile.setUrl(toDiskPath);
        sysFile.setCode(UUID.randomUUID().toString().replace("-", ""));
        sysFile.setCreateDate(new Date());
        sysFile.setState(1);

        return sysFile;
    }


    @PostMapping("/upload/v2")
    public ResponseVo uploadFile2(MultipartFile file) {
        //对于文件做持久化操作
        //上传文件的问题
        //正常情况：变量名称，文件大小，文件格式，文件名称重复时候处理，文件在磁盘上的路径处理，文件路径记录到数据库，生成唯一编号
        //异常情况：文件为空判断，路径为空或者不合法判断，不支持的文件类型判断，文件重复判断，写入磁盘异常判断，写入磁盘成功，但是信息记录数据库出错，造成数据耗着磁盘，但是应用检索数据库时候并无法发现该文件， 需要做补偿来删除脏数据
        //注意此方法指向的是一个文件，而非文件夹
//            file.transferTo(new File("C:\\Users\\X\\Desktop\\upload\\1"));
        return ResponseVo.failure();

    }


    /////////////////////////////////////////////////////////////////////////////////////////todo 方法抽取
    public static String writeToDisk(InputStream inputStream, String outDir) {
        OutputStream outputStream = null;
        try {
            Assert.notNull(outDir, "No OutputStream specified");
            File outFile = new File(outDir);
            log.debug("结果outFile.exists={}", outFile.exists());
            if (!outFile.exists()) {
                boolean mkParentDirs = outFile.getParentFile().mkdirs();
                log.debug("父级文件夹{}，创建是否成功：{}", outFile.getParent(), mkParentDirs);
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
        log.debug("文件保存在本地磁盘的位置为={}", outDir);
        return outDir;
    }

    private static void writeToDisk(File source, File target) throws IOException {
        //            String data = " This content will append to the end of the file";
        //        File target = new File("C:\\Users\\X\\Desktop\\upload\\target.txt");
        //        source = new File("C:\\Users\\X\\Desktop\\upload\\test.txt");
        //        if file doesnt exists, then create it
        //        if (!source.exists()) {
        //            source.createNewFile();
        //        }
        if (!target.exists()) {
            target.createNewFile();
        }
        BufferedWriter bufferedWriter = new BufferedWriter(new FileWriter(source, true));
        bufferedWriter.write(target.getAbsolutePath());
        bufferedWriter.close();
        System.out.println("------>Done<--------");
    }
}
