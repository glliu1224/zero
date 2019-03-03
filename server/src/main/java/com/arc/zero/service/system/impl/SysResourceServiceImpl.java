package com.arc.zero.service.system.impl;

import com.arc.enums.system.ParentKey;
import com.arc.enums.system.SysResourceType;
import com.arc.enums.system.WebSysResource;
import com.arc.model.domain.system.SysResource;
import com.arc.zero.service.system.SysResourceService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * @author 叶超
 * @since 2019/1/30 17:33
 */
@Slf4j
@Service
public class SysResourceServiceImpl implements SysResourceService {


    @Resource
    private ApplicationContext applicationContext;


    /**
     * @return 扫描系统controller的url 路径，然后保存到数据库
     */
    private Integer createSysResource() {
        Integer result = null;
        //1 清空已有资源
        //2 保存固定的根节点
        //3 获取根节点的 代号--id 的map
//        Map<String, String> mapRoot = this.createRoot();
        List<SysResource> secondList = new ArrayList<>();//二级节点list
        List<SysResource> thirdList = new ArrayList<>();
        //获取所有的路径-- Controller  equestMappings
        Map<String, Object> beansWithAnnotation = applicationContext.getBeansWithAnnotation(Controller.class);
        beansWithAnnotation.putAll(applicationContext.getBeansWithAnnotation(RestController.class));
        Collection<Object> beans = beansWithAnnotation.values();
        for (Object bean : beans) {
            Method[] methods = bean.getClass().getDeclaredMethods();
            for (Method method : methods) {
                if (method.isAnnotationPresent(WebSysResource.class)) {
                    WebSysResource annotation = method.getAnnotation(WebSysResource.class);
                    if (annotation != null) {
                        String realmName = annotation.realmName();
                        String note = annotation.note();
                        Integer priority = annotation.priority();
                        SysResourceType type = annotation.type();
                        ParentKey parentKey = annotation.parentKey();//指明父级是什么
                        ParentKey key = annotation.key();
                        RequestMethod[] requestMethods = method.getAnnotation(RequestMapping.class).method();//被请求的方法是何种类型 请求方法的 数组 7种

                        String packageName = method.getDeclaringClass().getPackage().getName();//预计是 packageName
                        String[] path1 = method.getDeclaringClass().getAnnotation(RequestMapping.class).value();//预期 类上的地址  数组的[0] 可能 为null！！
                        String[] path2 = method.getAnnotation(RequestMapping.class).value();//路径 但是怎么获取类上贴的那部分url呢？

                        String wholeUrl = path1[0].toString() + path2[0].toString();//预计是完整路径
                        if (!wholeUrl.startsWith("/")) {
                            wholeUrl = "/" + wholeUrl;//补全url
                        }

//                         SysResourceServiceImpl.getRequestMethods(requestMethods);//【请求方法】（GET，POST，ALL）

                        //  参数 pack url method
//                        String realmKey = SysResourceServiceImpl.getId(packageName, wholeUrl, requestMethod.toString());// id=realmKey
//
//                        SysResource realm = new SysResource();//新建 资源
//                        realm.setSysResourceName(realmName);
//                        realm.setNote(note);
//                        realm.setPriority(priority);
//                        realm.setType(type);
//
//                        realm.setKey(key);
//                        realm.setPath(wholeUrl);
//                        realm.setMethod(requestMethod);//??? POST GET
//                        realm.setId(realmKey);
                        // String parentId;//父级id
//                        if (SysResourceType.LINK.equals(realm.getType())) {//LINK 类型的资源是二级资源
//                            String parentId = mapRoot.get(parentKey.toString());
//                            realm.setParentId(parentId);//设置二级资源的parentId
//                            secondList.add(realm);
//                        } else {
//                            realm.setParentId(parentKey.toString());//把父级标记 parentKey暂存 parentId 字段
//                            thirdList.add(realm);//三级的怎么处理？？
//                        }
                    }
                }
            }
        }

//
//        result = this.save(secondList);// 批量保存 二级节点
//        //保存二级数据到  map     id --parentKey
//        for (SysResource realm : secondList) {
//            mapRoot.put(realm.getKey().toString(), realm.getId());
//        }
//
//        //三级资源设置parentId
//        for (SysResource realm : thirdList) {
//            realm.getParentId();
//            realm.setParentId(mapRoot.get(realm.getParentId()));
//        }
//        result = this.save(thirdList);// 批量保存 二级节点

//        this.createInitRole();//初始化角色admin
        return result;
    }
}
