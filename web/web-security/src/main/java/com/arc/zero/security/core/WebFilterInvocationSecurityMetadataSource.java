//package com.arc.zero.security.core;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.security.access.ConfigAttribute;
//import org.springframework.security.web.FilterInvocation;
//import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
//import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
//
//import javax.servlet.http.HttpServletRequest;
//import java.util.Collection;
//import java.util.HashMap;
//import java.util.Iterator;
//
////@Service
//public class WebFilterInvocationSecurityMetadataSource implements FilterInvocationSecurityMetadataSource {
//    private static final Logger logger = LoggerFactory.getLogger(WebFilterInvocationSecurityMetadataSource.class);
//    private HashMap<String, Collection<ConfigAttribute>> map = null;
//
//    //构造资源map
//    // 资源 Map< 资源的URL  ,  资源名称>
//    // 角色Map<roleId， 资源的URL>
//    //用户Map<userId ,   roleId>
//
//
////    @Autowired
////    private RealmService realmService;
//
//    /**
//     * 加载权限表中所有权限
//     */
//    public void loadResourceDefine() {
//        // 调用服务去查出所有资源信息 map<url [roleName]>
//        map = new HashMap<>();
//        Collection<ConfigAttribute> array = null;
//        ConfigAttribute ca;
//
//
//	/*	List<Realm> realms = realmService.listAll();
//		logger.debug("realms.size from mysql   "+realms.size());
//
//		for (Realm permission : realms) {
//			if (permission != null) {
//				if (permission.getRoles() != null) {
//					array = new ArrayList<>();
//					for (Role role : permission.getRoles()) {
//						ca = new SecurityConfig(role.getRoleName());
//						array.add(ca);
//                        String path = permission.getPath();
//                        logger.debug("【REALM_MAP  URI-ROLE】 " + path+"-"+array);
//                        map.put(path, array);
//					}
//				}
//			}
//			// 用权限的getUrl() 作为map的key，用ConfigAttribute的集合作为
//			// value，//MyAccessDecisionManager类的decide方法会用到
//		}*/
//
//
//        /////////////////注意RBAC 最重要的验证身份就是在这里写出来的    即：
//        logger.debug("权限map的size " + map.size());
//    }
//
//    // 此方法是为了判定用户请求的url 是否在权限表中，如果在权限表中，则返回给 decide 方法，
//    // 用来判定用户是否有此权限。如果不在权限表中则放行。
//    @Override
//    public Collection<ConfigAttribute> getAttributes(Object object) throws IllegalArgumentException {
//        loadResourceDefine();// 加载资源map
//        logger.debug("权限map的size " + map.size());
//        // object 中包含用户请求的request 信息
//        HttpServletRequest request = ((FilterInvocation) object).getHttpRequest();
//
//        logger.debug("用户请求的request url 信息  " + request.getServletPath());
//        AntPathRequestMatcher matcher;// 匹配
//        String mapUrl;
//        for (Iterator<String> iter = map.keySet().iterator(); iter.hasNext(); ) {
//            mapUrl = iter.next();
////			logger.debug("【map的key   url 】:" + mapUrl);
//            matcher = new AntPathRequestMatcher(mapUrl);
//            if (matcher.matches(request)) {
//                logger.debug("【匹配成功的   url】 :" + mapUrl);
//                Collection<ConfigAttribute> configAttributes = map.get(mapUrl);
//                return configAttributes;
//            }
//        }
//        return null;
//    }
//
//    @Override
//    public Collection<ConfigAttribute> getAllConfigAttributes() {
//        return null;
//    }
//
//    @Override
//    public boolean supports(Class<?> clazz) {
//        return true;
//    }
//}
