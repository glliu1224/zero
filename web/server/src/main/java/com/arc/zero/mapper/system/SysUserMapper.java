package com.arc.zero.mapper.system;

import com.arc.model.domain.system.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * JAVA项目是分层来写的，
 * 这是持久层，目的是与数据库交互，
 */
public interface SysUserMapper {

    int save(SysUser user);

    int delete(Long id);

    int update(SysUser user);

    SysUser get(Long id);

    /**
     * 根据用户名称获取用户信息
     *
     * @param identifier
     * @return
     */
    SysUser getByIdentifierAndIdentityType(@Param("identifier") String identifier, @Param("identityType") Integer identityType);

    List<SysUser> list();

}
