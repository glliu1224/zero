package com.arc.zero.security.core;


import com.arc.model.domain.system.SysUser;
import com.arc.zero.security.model.SecurityUser;
import com.arc.zero.service.system.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import javax.annotation.Resource;
import java.time.LocalDateTime;

/**
 * 从数据库中获取用户信息
 * 实现一个方法：loadUserByUsername
 * 作用 即从数据库中取出用户名、密码以及权限相关的信息。最后返回一个UserDetails 实现类
 * 注意：这里不用@service注解，服务由配置类统一注入
 *
 * @author 叶超
 * @date 2019/01/23
 */
@Slf4j
//@Service("securityUserService")
public class SecurityUserService implements org.springframework.security.core.userdetails.UserDetailsService {


    /**
     * 从db查询user 认证信息 的服务
     */
    @Resource
    private SysUserService userService;

    @Override
    public org.springframework.security.core.userdetails.UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //查数据库获得user 走缺省状态 Integer identityType =1
        SysUser user = userService.getByIdentifierAndIdentityType(username, null);
        log.info("#登录#username={}  try login at {} . LoadUserByUsername get SysUserAuth={}", username, LocalDateTime.now(), user);
        if (user == null) {
            throw new UsernameNotFoundException("SysUser [ " + username + " ] not found. ");
        }
        return SecurityUser.build(user);
    }
}
