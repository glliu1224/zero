package com.arc.zero.service.system.impl;

import com.arc.model.domain.system.SysRole;
import com.arc.zero.mapper.system.SysRoleMapper;
import com.arc.zero.service.system.SysRoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @description:
 * @author: yechao
 * @date: 2019/1/25 11:21
 */
@Slf4j
@Service
public class SysRoleServiceImpl implements SysRoleService {
    @Resource
    private SysRoleMapper roleMapper;

    @Override
    public int save(SysRole role) {
        return roleMapper.save(role);
    }

    @Override
    public int delete(Long id) {
        return roleMapper.delete(id);
    }

    @Override
    public int update(SysRole role) {
        return roleMapper.update(role);
    }

    @Override
    public SysRole get(Long id) {
        return roleMapper.get(id);
    }

    @Override
    public List<SysRole> list() {
        return roleMapper.list();
    }
}
