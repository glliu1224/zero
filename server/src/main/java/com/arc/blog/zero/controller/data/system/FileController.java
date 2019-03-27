package com.arc.blog.zero.controller.data.system;


import com.arc.blog.enums.ErrorCode;
import com.arc.blog.model.domain.system.SysFile;
import com.arc.blog.model.vo.ResponseVo;
import com.arc.blog.utils.FileUtil;
import com.arc.blog.zero.service.system.SysFileService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.compress.utils.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * 文件下载测试controller层
 *
 * @author yechao
 */
@Slf4j
@RestController
@RequestMapping("/file")
public class FileController {

    @Resource
    private SysFileService fileService;

    public static void main(String[] args) {
        String originalFilename = "DSC11..1.";
        String suffix = originalFilename.substring(originalFilename.lastIndexOf(".") + 1, originalFilename.length());
        System.out.println(suffix);
        System.out.println(originalFilename.length());
        System.out.println(originalFilename.lastIndexOf("."));
        System.out.println(originalFilename.lastIndexOf(".") + 1);
    }


    /**
     * 文件下载，或者说叫预览，总之就是文件传给用户
     *
     * @param code
     * @param response
     */
    @GetMapping("/{code}")
    public void fileDownload(@PathVariable("code") String code, HttpServletResponse response) {
        //根据文件id信息检索文件条目
        //获得文件所在路径
        //读取文件并返回

        //获取文件在数据库中记录的信息条目
        SysFile sysFile = fileService.getByCode(code);

        try (InputStream inputStream = new FileInputStream(new File(sysFile.getUrl()));
             OutputStream outputStream = response.getOutputStream();) {
            if (FileUtil.isImage(sysFile.getSuffix())) {
                response.setContentType("image/jpg");
            } else {
                response.setContentType("application/octet-stream");
                response.addHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(sysFile.getName(), "UTF-8"));
            }
            IOUtils.copy(inputStream, outputStream);
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 临时目录，注意你电脑上是否有该目录
     */
    @Value("${web.upload.file.path:/data/upload}")
    private String uploadDir;


    /**
     * 单文件上传
     * 记录日志
     * 判合法性，非空，大小，格式
     * 1、文件写入磁盘,注意文件不会被覆盖，因为不存在同名文件
     * 2、描述信息记录数据库
     *
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public ResponseVo singleFileUpload(MultipartFile file) {
        //需求判断文件是否为空 大小已经在yml中做了配置

        System.out.println(uploadDir);
        System.out.println(uploadDir);
        System.out.println(uploadDir);
        System.out.println(uploadDir);
        if (file != null && !file.isEmpty()) {
            log.debug("文件上传入参: 类型={}，名称={}，尺寸={} bytes", file.getContentType(), file.getOriginalFilename(), file.getSize());
            String code = fileService.writeFileToDiskAndRecord(file, uploadDir);
            return code == null ? ResponseVo.failure(ErrorCode.FAILURE) : ResponseVo.success(code);
        }
        log.info(ErrorCode.FAILURE.getMsg());
        return ResponseVo.failure(ErrorCode.FAILURE);

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
