package com.arc.blog.zero.service.system.impl;

import com.arc.blog.model.domain.system.SysUserAuth;
import com.arc.blog.zero.mapper.system.SysUserAuthMapper;
import com.arc.blog.zero.service.system.SysUserAuthService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * @author 叶超
 * @since 2019/1/30 17:33
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
