package com.arc.blog.zero.service.system;


import com.arc.blog.model.domain.system.SysUser;

import java.util.List;

/**
 * JAVA项目是分层来写的，
 * 这是服务层，目的是处理业务，
 *
 * @author yechao
 * @date 2018/12/21
 */
public interface SysUserService {

    Long save(SysUser SysUser);

    int delete(Long id);

    int update(SysUser SysUser);

    SysUser get(Long id);

    List<SysUser> list();


    /**
     * 特殊方法
     *      * 根据用户名称获取用户信息
     * t_sys_user_auth left join  t_sys_user
     *
     * @param identifier 身份标记
     * @param identityType  登录类型
     * @return SysUSer with auth
     */
    SysUser getByIdentifierAndIdentityType(String identifier,Integer identityType);

    /**
     * 测试用 登陆
     *
     * @param username
     * @param password
     * @return
     */
    Boolean login(String username, String password);

}
