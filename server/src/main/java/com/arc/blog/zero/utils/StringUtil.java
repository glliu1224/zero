package com.arc.blog.zero.utils;


import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtil {
    public static boolean isNull(String value) {
        return value != null && !"".equals(value.trim());
    }

    public static String getOrderIdByUUId() {
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if (hashCodeV < 0) {//有可能是负数
            hashCodeV = -hashCodeV;
        }
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return String.format("%011d", hashCodeV);
    }


    public static String getGuidByClaim() {
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if (hashCodeV < 0) {//有可能是负数
            hashCodeV = -hashCodeV;
        }
        // 0 代表前面补充0
        // 4 代表长度为4
        // d 代表参数为正数型
        return String.format("%6d", hashCodeV);
    }



    /**
     * 验证是否保留两位小数
     *
     * @param str
     * @return
     */
    public static boolean verifyTwoDecimal(String str) {
        String regexa = "^-?\\d+(\\.{1}\\d{2}){1}?$";
        Pattern p = Pattern.compile(regexa);
        Matcher m = p.matcher(str.trim());
        boolean dateFlag = m.matches();
        return dateFlag;
    }
    /**
     * 验证是否保留5位小数
     *
     * @param str
     * @return
     */
    public static boolean verifyFiveDecimal(String str) {
        String regexa = "^-?\\d+(\\.{1}\\d{5}){1}?$";
        Pattern p = Pattern.compile(regexa);
        Matcher m = p.matcher(str.trim());
        boolean dateFlag = m.matches();
        return dateFlag;
    }

    /**
     * 验证是否正整数小数
     *
     * @param str
     * @return
     */
    public static boolean verifyPositiveInteger(String str) {
        String regexa = "^[1-9]\\d*|0$";
        Pattern p = Pattern.compile(regexa);
        Matcher m = p.matcher(str.trim());
        boolean dateFlag = m.matches();
        return dateFlag;
    }




    //根据value值获取到对应的一个key值
    public static String getKey(HashMap<String, String> map, String value) {
        String key = null;
        //Map,HashMap并没有实现Iteratable接口.不能用于增强for循环.
        for (String getKey : map.keySet()) {
            if (map.get(getKey).equals(value)) {
                key = getKey;
            }
        }
        return key;
        //这个key肯定是最后一个满足该条件的key.
    }

    //根据value值获取到对应的所有的key值
    public static List<String> getKeyList(HashMap<String, String> map, String value) {
        List<String> keyList = new ArrayList();
        for (String getKey : map.keySet()) {
            if (map.get(getKey).equals(value)) {
                keyList.add(getKey);
            }
        }
        return keyList;
    }

    public static Character getCharByString(String s) {
        Character character;
        char[] chars = s.toCharArray();
        if(chars.length>1){
           return chars[0];
        }else {
         character = new Character(chars[0]);
        }
        return character;
    }


    public static double formatDouble(double d) {
        // 旧方法，已经不再推荐使用
        // BigDecimal bg = new BigDecimal(d).setScale(2, BigDecimal.ROUND_HALF_UP);
        // 新方法，如果不需要四舍五入，可以使用RoundingMode.DOWN
        BigDecimal bg = new BigDecimal(d).setScale(2, RoundingMode.UP);
        return bg.doubleValue();
    }

    public static void main(String[] args) {
        double d1 = formatDouble(222222.90);
        boolean b2 = verifyPositiveInteger("23456");
        boolean b3 = verifyPositiveInteger("2222");
        boolean b4 = verifyPositiveInteger("0.00005");

        System.out.println(d1);
        System.out.println(b2);
        System.out.println(b3);
        System.out.println(b4);
    }
    //兩個double類型相減
    public static Double sub(Double v1, Double v2){
        DecimalFormat df = new DecimalFormat("######0.00");
        v1=Double.parseDouble(df.format(v1));
        v2=Double.parseDouble(df.format(v2));
        BigDecimal bigDecimal = new BigDecimal(v1.toString());
        BigDecimal bigDecima2 = new BigDecimal(v2.toString());
        return bigDecimal.subtract(bigDecima2).doubleValue();
    }


}

