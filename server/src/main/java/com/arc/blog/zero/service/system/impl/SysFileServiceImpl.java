package com.arc.blog.zero.service.system.impl;

import com.arc.blog.model.domain.system.SysFile;
import com.arc.blog.utils.FileUtil;
import com.arc.blog.zero.mapper.system.SysFileMapper;
import com.arc.blog.zero.service.system.SysFileService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author yechao
 * @since 2019/1/13 19:41
 */
@Service
public class SysFileServiceImpl implements SysFileService {
    private static final Logger log = LoggerFactory.getLogger(FileUtil.class);

    @Resource
    private SysFileMapper sysFileMapper;


    @Override
    public Long save(SysFile sysFile) {
        return sysFileMapper.save(sysFile) == 0 ? null : sysFile.getId();
    }

    @Override
    public int delete(Long id) {
        return sysFileMapper.delete(id);
    }

    @Override
    public int update(SysFile sysFile) {
        return sysFileMapper.update(sysFile);
    }

    @Override
    public SysFile get(Long id) {
        return sysFileMapper.get(id);
    }

    @Override
    public SysFile getByCode(String code) {
        return sysFileMapper.getByCode(code);
    }

    @Override
    public List<SysFile> list() {
        return sysFileMapper.list();
    }

    /**
     * 文件持久化并在数据库做记录
     * 注意文件名称保证不相同，不存在重复文件覆盖问题，同时带来一个问题，前端相同文件重复上传造成服务端资源浪费，建议用定时线程去清理无效的重复文件
     * 记录日志
     * 判合法性，非空，大小，格式
     * 1、文件写入磁盘,注意文件不会被覆盖，因为不存在同名文件
     * 2、描述信息记录数据库
     *
     * @param file    文件
     * @param tempDir 目录
     * @return 数据库标记的code，用于查询
     */
    @Override
    public String writeFileToDiskAndRecord(MultipartFile file, String tempDir) {
        //返回code

        System.out.println("getName=" + file.getName());//file
        System.out.println("getResource=" + file.getResource());//MultipartFile resource [file]
        System.out.println("getContentType=" + file.getContentType());//application/vnd.openxmlformats-officedocument.wordprocessingml.document
        System.out.println("getOriginalFilename=" + file.getOriginalFilename());//记录.docx


        //需求判断文件是否为空
        if (file != null && !file.isEmpty()) {
            log.debug("文件上传入参: 类型={}，名称={}，尺寸={} bytes", file.getContentType(), file.getOriginalFilename(), file.getSize());

            //文件落地--文件名称 文路径
            //存在该文件夹吗？
            //是文件夹吗？
            File outFile = new File(tempDir);

            if (!outFile.exists()) {
                // boolean mkdir() :  创建此抽象路径名指定的目录。 父级路径若不存在则不会创建该目录。
                // boolean mkdirs() :  创建此抽象路径名指定的目录，包括创建必需但不存在的父目录。父级路径若不存在则会创建该目录。
                boolean mkdirs = outFile.mkdirs();
                if (!mkdirs) {
                    throw new RuntimeException("文件夹不存在，并创建失败，文件终止保存");
                }
            }

            //getAbsolutePath()  方法去除了干扰   ./   ../
            String writeFile = outFile.getAbsolutePath() + "\\" + FileUtil.getTargetFileName(file.getOriginalFilename());
            String toDiskPath = null;
            try {
                toDiskPath = FileUtil.writeToDisk(file.getInputStream(), writeFile);
            } catch (IOException e) {
                e.printStackTrace();
                log.error("error={}", e);
            }
            if (toDiskPath != null) {
                //描述信息记录数据库
                SysFile sysFile = createSysFile(file, toDiskPath);
                Long id = this.save(sysFile);
                return id == null ? null : toDiskPath;
            }
        }
        return null;

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
        int index = toDiskPath.lastIndexOf("\\");
        sysFile.setCode(toDiskPath.substring(index+1, index + 45+1));
        sysFile.setCreateDate(new Date());
        sysFile.setState(1);

        return sysFile;
    }


    public static void main(String[] args) {
        System.out.println("1553674217365a397a335a8c54dce9d422da32ddbbef6".length());
        String temp = "C:\\Users\\X\\Desktop\\UP\\A\\155367377470183239d3c40fb4abebf0efd383e20d854_DSC_0007.JPG";
        //45
        int index = temp.lastIndexOf("\\");

        String code = temp.substring(index+1, index + 45+1);
        System.out.println(code);
    }

}
