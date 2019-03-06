package com.arc.blog.zero.mapper.system;

import com.arc.blog.model.domain.system.SysResource;

import java.util.List;

/**
 * JAVA项目是分层来写的，
 * 这是持久层，目的是与数据库交互，
 */
public interface SysResourceMapper {

    int save(SysResource user);

    int delete(Long id);

    int update(SysResource user);

    SysResource get(Long id);

    List<SysResource> list();

}
