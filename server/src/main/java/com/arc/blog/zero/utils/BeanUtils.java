package com.arc.blog.zero.utils;

import org.springframework.cglib.beans.BeanCopier;

import java.util.HashMap;
import java.util.Map;

/**
 * 对象属性拷贝工具
 *
 * @author 叶超
 * @since 2019/1/30 17:33
 */
public class BeanUtils {

    private BeanUtils() {
    }

    /**
     * BeanCopier缓存
     */
    private static Map<String, BeanCopier> beanCopierMap = new HashMap<>();

    private static final String UID_STR = "serialVersionUID";

    // TODO: 2019/3/3   拷贝内容
//    /**
//     * 拷贝内容
//     *
//     * @param source Object
//     * @param target Object
//     */
//    public static void copyProperties(Object source, Object target) {
//        String beanKey = generateKey(source.getClass(), target.getClass());
//        BeanCopier copier = null;
//        if (beanCopierMap.containsKey(beanKey)) {
//            copier = BeanCopier.create(source.getClass(), target.getClass(), false);
//            //缓存这个
//            beanCopierMap.put(beanKey, copier);
//        } else {
//            copier.copy(source, target, null);
//        }
//    }

    /**
     * 生成key
     *
     * @param sourceClass Class<?>
     * @param targetClass Class<?>
     * @return String
     */
    private static String generateKey(Class<?> sourceClass, Class<?> targetClass) {
        return sourceClass.toString() + targetClass.toString();
    }


}
