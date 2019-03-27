package com.arc.blog.zero.controller.data.system;


import com.arc.blog.model.domain.system.SysFile;
import com.arc.blog.utils.FileUtil;
import com.arc.blog.zero.service.system.SysFileService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.compress.utils.IOUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
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
        System.out.println(originalFilename.lastIndexOf(".")+1);
    }


    /**
     * 文件下载，或者说叫预览，总之就是文件传给用户
     *
     * @param id
     * @param response
     */
    @GetMapping("/{fileCode}")
    public void fileDownload(@PathVariable("id") Long id, HttpServletResponse response) {
        //根据文件id信息检索文件条目
        //获得文件所在路径
        //读取文件并返回

        //获取文件在数据库中记录的信息条目
        SysFile sysFile = fileService.get(id);
        try (InputStream inputStream = new FileInputStream(new File(sysFile.getUrl()));
             OutputStream outputStream = response.getOutputStream();) {

            // 设置文件名
            response.addHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(sysFile.getName(), "UTF-8"));
            response.setContentType("application/octet-stream");

            IOUtils.copy(inputStream, outputStream);
            outputStream.flush();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 文件展示
     *
     * @param id
     * @param response
     */
    @GetMapping("/show/id")
    public void reveal(@PathVariable("id") Long id, HttpServletResponse response) {
        SysFile fileInfo = fileService.get(id);
        InputStream inputStream = null;
        OutputStream outputStream = null;
        try {
            inputStream = new FileInputStream(new File(fileInfo.getUrl()));
            outputStream = response.getOutputStream();
            String contentType = getContentType(fileInfo.getUrl());
//            // 因此展示接口不需要验证JWT，非允许展示的文件类型不允许返回
//            if (StringUtils.isBlank(contentType)) {
//                throw new WebRuntimeException(ErrorCode.ILLEGAL_ARGUMENT, "获取文件类型错误");
//            }
            if ("application/octet-stream".equals(contentType)) {
                response.addHeader("Content-Disposition", "attachment;fileName=" + URLEncoder.encode(fileInfo.getName(), "UTF-8"));
            }
            response.setContentType(contentType);
            IOUtils.copy(inputStream, outputStream);
            outputStream.flush();
        } catch (Exception e) {
            //TODO
            e.printStackTrace();
        } finally {
            IOUtils.closeQuietly(inputStream);
            IOUtils.closeQuietly(outputStream);
        }
    }

    private String getContentType(String realPath) {
        String extensionName = FileUtil.getExtensionName(realPath).toLowerCase();
        switch (extensionName) {
            case "jpg":
            case "jpeg":
                return "image/jpg";
            case "gif":
                return "image/gif";
            case "png":
                return "image/png";
            case "bmp":
                return "image/bmp";
            case "pdf":
                return "application/pdf";
            default:
                return "application/octet-stream";
        }
    }


}
