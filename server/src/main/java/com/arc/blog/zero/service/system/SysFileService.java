package com.arc.blog.zero.service.system;


import com.arc.blog.model.domain.system.SysFile;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * JAVA项目是分层来写的，
 * 这是服务层，目的是处理业务，
 *
 * @author yechao
 * @date 2018/12/21
 */
public interface SysFileService {

    Long save(SysFile sysFile);

    int delete(Long id);

    int update(SysFile sysFile);

    SysFile get(Long id);

    List<SysFile> list();

    /**
     * 文件持久化并在数据库做记录
     * 注意文件名称保证不相同，不存在重复文件覆盖问题，同时带来一个问题，前端相同文件重复上传造成服务端资源浪费，建议用定时线程去清理无效的重复文件
     *
     * @param file    文件
     * @param tempDir 目录
     * @return 数据库标记的code，用于查询
     */
    String writeFileToDiskAndRecord(MultipartFile file, String tempDir);

    SysFile getByCode(String code);
}
