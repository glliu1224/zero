package com.arc.blog.zero.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 流水号生成工具
 *
 * @author Rubin
 * 2018/10/24 14:23
 */
public class SerialCodeUtil {

    /**
     * 获取现在时间字符串
     */
    private static String getStringDate() {
        Date currentTime = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        return formatter.format(currentTime);
    }

    /**
     * 简单流水号生成：
     * 由年月日时分秒+3位随机数
     */
    public static String getSimpleCode() {
        String t = getStringDate();
        int x = (int) (Math.random() * 900) + 100;
        return t + x;
    }

}
