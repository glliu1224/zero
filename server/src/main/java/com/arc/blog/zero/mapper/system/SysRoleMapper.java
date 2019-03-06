package com.arc.blog.zero.mapper.system;

import com.arc.blog.model.domain.system.SysRole;

import java.util.List;

/**
 * @description:
 * @author: yechao
 * @date: 2019/1/24 9:57
 */
public interface SysRoleMapper {

    int save(SysRole user);

    int delete(Long id);

    int update(SysRole user);

    SysRole get(Long id);

    List<SysRole> list();

}
