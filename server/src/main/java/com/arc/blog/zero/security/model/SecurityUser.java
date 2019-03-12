package com.arc.blog.zero.security.model;


import com.arc.blog.enums.common.EnableDisable;
import com.arc.blog.model.domain.system.SysRole;
import com.arc.blog.model.domain.system.SysUser;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 * spring security 内部认的 用户 Spring Security中，
 * 用户信息保存在SecurityContextHolder中，
 * 在Controller中使用SecurityUser代替User
 *
 * @author dengqianyong@besttone.com.cn
 */
@Slf4j
@ToString
public class SecurityUser implements org.springframework.security.core.userdetails.UserDetails {

    private static final long serialVersionUID = 1L;

    private Collection<GrantedAuthority> authorities;

    private SysUser user;


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }


    /**
     * 登录时候的密码类似password
     *
     * @return 密码凭证（站内的保存密码，站外的不保存或保存token）
     */
    @Override
    public String getPassword() {
        return user.getAuth().getCredential();
    }

    /**
     * 登录时候的标识类似username
     *
     * @return 标识（手机号 邮箱 用户名或第三方应用的唯一标识）
     */
    @Override
    public String getUsername() {
        return user.getAuth().getIdentifier();
    }

    //不过期？
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    //不锁定？
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {

//        return false;
        return true;
    }

    @Override
    public boolean isEnabled() {
        log.debug(" EnableDisable.ENABLE.getNumber() ={}--getStatus()={}", EnableDisable.ENABLE.getNumber(), getStatus());
        boolean equals = EnableDisable.ENABLE.getNumber() == getStatus();
        log.debug(" SecurityUser isEnabled  系统用户状态={}", equals);

        return equals;

    }

    //------扩展：


    public void setAuthorities(Collection<GrantedAuthority> authorities) {
        this.authorities = authorities;
    }

    public SysUser getUser() {
        return user;
    }

    public List<SysRole> getRoles() {
        return user.getRoles();
    }


    //@todo 账号禁用
    public Integer getStatus() {
        return user.getAuth().getStatus();
    }

    public void setUser(SysUser user) {
        this.user = user;
    }


    // 构造 SecurityUser
    public SecurityUser(SysUser user) {
        super();
        this.user = user;

        //对于角色的处理
               /* if (user.getRoles().size() > 0) {
           for (Role role : user.getRoles()) {
                if (EnableDisable.DISABLE.equals(  role.getState())) {//如果这个角色禁用了
                    role = null;
                    continue;
                }
                if (EnableDisable.ENABLE.equals(role.getRootAdmin())) {//如果是管理员
                    authsList.add(new SimpleGrantedAuthority(role.getRoleName()));//1：此处将权限信息添加到 GrantedAuthority 对象中，在后面进行全权限验证时会使用GrantedAuthority 对象。
                    break;
                }
                    log.debug("用户认证的角色名称  "+ role.getRoleName());
                   authsList.add(new SimpleGrantedAuthority(role.getRoleName()));//1：此处将权限信息添加到 GrantedAuthority 对象中，在后面进行全权限验证时会使用GrantedAuthority 对象。

            }
        }*/

        if (getRoles() == null) {
            authorities = Collections.emptyList();
        } else {
            this.authorities = new ArrayList<>(getRoles().size());
            getRoles().forEach((role) -> {
                this.authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
            });
        }
    }


    public SecurityUser() {
    }

    public static SecurityUser build(SysUser user) {
        SecurityUser securityUser = new SecurityUser(user);
        log.debug("Found user [{}]. 具有的角色[{}]", securityUser, securityUser.getAuthorities());
        return securityUser;
    }

}
