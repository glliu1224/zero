package com.arc.zero.service.system;

import com.arc.model.domain.system.SysRole;

import java.util.List;


/**
 * @author 叶超
 * @since 2019/1/30 17:33
 */
public interface SysRoleService {

    int save(SysRole role);

    int delete(Long id);

    int update(SysRole role);

    SysRole get(Long id);

    List<SysRole> list();
}
