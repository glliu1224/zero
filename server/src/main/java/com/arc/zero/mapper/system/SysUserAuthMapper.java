package com.arc.zero.mapper.system;

import com.arc.model.domain.system.SysUserAuth;
import org.apache.ibatis.annotations.Param;

/**
 * JAVA项目是分层来写的，
 * 这是持久层，目的是与数据库交互，
 */
public interface SysUserAuthMapper {

    int save(SysUserAuth user);

    int delete(Long id);

    int update(SysUserAuth user);

    SysUserAuth get(Long id);

    /**
     * 通过 登录类型 & 标识 获取用户登录信息
     * @param identityType 登录类型
     * @param identifier 标识
     * @return 用户授权信息
     */
    SysUserAuth getByIdentityTypeAndIdentifier(@Param("identityType") Integer identityType, @Param("identifier") String identifier);


}
