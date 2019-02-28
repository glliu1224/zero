package com.arc.zero.utils;

import org.springframework.cglib.beans.BeanCopier;

import java.util.HashMap;
import java.util.Map;

/**
 * 对象属性拷贝工具
 *
 * @author: yechao
 * @since: 2019/1/28 17:25
 */
public class BeanUtils {

    private BeanUtils() {
    }

    /**
     * BeanCopier缓存
     */
    public static Map<String, BeanCopier> beanCopierMap = new HashMap<>();

    private static final String UID_STR = "serialVersionUID";

    /**
     * 拷贝内容
     *
     * @param source
     * @param target
     */
    public static void copyProperties(Object source, Object target) {
        String beanKey = generateKey(source.getClass(), target.getClass());
        BeanCopier copier = null;
        if (beanCopierMap.containsKey(beanKey)) {
            copier = BeanCopier.create(source.getClass(), target.getClass(), false);
            //缓存这个
            beanCopierMap.put(beanKey, copier);
        } else {
            copier.copy(source, target, null);
        }


    }

    /**
     * 生成key
     *
     * @param sourceClass
     * @param targetClass
     * @return
     */
    private static String generateKey(Class<?> sourceClass, Class<?> targetClass) {
        return sourceClass.toString() + targetClass.toString();
    }


}
