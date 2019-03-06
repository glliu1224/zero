package com.arc.blog.zero.mapper.system;


import com.arc.blog.model.domain.system.SysFile;

import java.util.List;

/**
 * JAVA项目是分层来写的，
 * 这是持久层，目的是与数据库交互，
 */
public interface SysFileMapper {

    int save(SysFile sysFile);

    int delete(Long id);

    int update(SysFile sysFile);

    SysFile get(Long id);

    List<SysFile> list();

}
