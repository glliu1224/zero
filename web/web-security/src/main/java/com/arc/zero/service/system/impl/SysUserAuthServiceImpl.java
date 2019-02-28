package com.arc.zero.service.system.impl;

import com.arc.model.domain.system.SysUserAuth;
import com.arc.zero.mapper.system.SysUserAuthMapper;
import com.arc.zero.service.system.SysUserAuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @description:
 * @author: yechao
 * @date: 2019/1/24 11:18
 */
@Slf4j
@Service
public class SysUserAuthServiceImpl implements SysUserAuthService {

    @Resource
    private SysUserAuthMapper authMapper;

    @Override
    public int save(SysUserAuth auth) {
        return authMapper.save(auth);
    }

    @Override
    public int delete(Long id) {
        return authMapper.delete(id);
    }

    @Override
    public int update(SysUserAuth auth) {
        return authMapper.update(auth);
    }

    @Override
    public SysUserAuth get(Long id) {
        return authMapper.get(id);
    }

    @Override
    public SysUserAuth getByIdentityTypeAndIdentifier(Integer identityType, String identifier) {
        return authMapper.getByIdentityTypeAndIdentifier(identityType,identifier);
    }

    @Override
    public SysUserAuth getByUsername(String username) {
        return getByIdentityTypeAndIdentifier(1,username);
    }
}
