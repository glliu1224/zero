//package com.arc.zero.security.core;
//
//import org.apache.commons.logging.Log;
//import org.apache.commons.logging.LogFactory;
//import org.springframework.security.access.AccessDecisionManager;
//import org.springframework.security.access.AccessDeniedException;
//import org.springframework.security.access.ConfigAttribute;
//import org.springframework.security.authentication.InsufficientAuthenticationException;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.GrantedAuthority;
//
//import java.util.Collection;
//import java.util.Iterator;
//
///**
// * 授权决策器
// *
// * @author 叶超
// */
//
////@Service
//public class WebAccessDecisionManager implements AccessDecisionManager {
//    private static final Log logger = LogFactory.getLog(WebAccessDecisionManager.class);
//
//    // decide 方法是判定是否拥有权限的决策方法，
//    //authentication 是释CustomUserService中循环添加到 GrantedAuthority 对象中的权限信息集合.
//    //object 包含客户端发起的请求的requset信息，可转换为 HttpServletRequest request = ((FilterInvocation) object).getHttpRequest();
//    //configAttributes 为 MyInvocationSecurityMetadataSource 的 getAttributes(Object object)这个方法返回的结果，
//    // 此方法是为了判定用户请求的url 是否在权限表中，如果在权限表中，则返回给 decide 方法，用来判定用户是否有此权限。如果不在权限表中则放行。
//    @Override
//    public void decide(Authentication authentication, Object object, Collection<ConfigAttribute> configAttributes) throws AccessDeniedException, InsufficientAuthenticationException {
//
//        if (null == configAttributes || configAttributes.size() <= 0) {
//            return;
//        }
//        ConfigAttribute c;
//        String needRole;
//        int index = 0;
//        for (Iterator<ConfigAttribute> iter = configAttributes.iterator(); iter.hasNext(); ) {
//            index = index + 1;
//            c = iter.next();
//            needRole = c.getAttribute();//需要的权限
//            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();//用户权限名称 集合
//            logger.debug("用户 authentication            " + authentication);
//            logger.debug("用户权限名称 集合            " + authorities.size());
//            if (authorities.size() < 1) {
//                throw new AccessDeniedException("用户已经登陆但是没有权限，NO RIGHT！");
//            }
//            for (GrantedAuthority ga : authorities) {//authentication 为在注释1 中循环添加到 GrantedAuthority 对象中的权限信息集合
//                logger.debug("需要的权限        " + needRole);
//                logger.debug("用户抽取出的权限            " + ga);
//                logger.debug("验证主体的权限     " + ga.getAuthority());
//                if (needRole.trim().equals(ga.getAuthority())) {
//                    return;
//                }
//            }
//        }
//        throw new AccessDeniedException("no right");
//    }
//
//    @Override
//    public boolean supports(ConfigAttribute attribute) {
//        return true;
//    }
//
//    @Override
//    public boolean supports(Class<?> clazz) {
//        return true;
//    }
//}
