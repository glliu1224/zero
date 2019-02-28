package com.arc.zero.service.system;

import com.arc.model.domain.system.SysUserAuth;

/**
 * @description:
 * @author: yechao
 * @date: 2019/1/24 11:16
 */
public interface SysUserAuthService {

    int save(SysUserAuth auth);

    int delete(Long id);

    int update(SysUserAuth auth);

    SysUserAuth get(Long id);

    /**
     * 通过 登录类型 & 标识 获取用户登录信息
     * @param identityType 登录类型
     * @param identifier 标识
     * @return 用户授权信息
     */
    SysUserAuth getByIdentityTypeAndIdentifier( Integer identityType, String identifier);

    /**
     * 通过 登录类型=1 & 标识 获取用户登录信息
     * @param username 标识
     * @return 用户授权信息
     */
    SysUserAuth getByUsername(String username);
}
