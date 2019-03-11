package com.arc.blog.zero.utils;

import org.apache.commons.lang3.Validate;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils extends org.apache.commons.lang3.time.DateUtils {

    public static String dateFormart(){
        return "222";
    }
    private static String[] parsePatterns = {
            "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM",
            "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM",
            "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM"};
    //将字符串转为data
    public static Date changeToDate(String str) {
        try{
            return parseDate(str,parsePatterns);
        }catch (ParseException e){
            e.printStackTrace();
        }
        return null;
    }

    //将Object转为字符串
    public static String  changeDate(Object obj) {
        try{
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            return format.format(format.parse(obj.toString()));
        }catch (ParseException e){
            e.printStackTrace();
        }
        return null;
    }

    //将Date转为字符串
    public static String  changeDate(Date date) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        return format.format(date);
    }

    //通过参数获取指定日期
    public static Date getDate(int basis,Date date,int value) {
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(date);
            int tempDate = calendar.get(basis);
            calendar.set(basis,tempDate + value);
            return calendar.getTime();
    }

    public static void main(String[] args)throws ParseException {
        /*System.out.println(changeToDate("2018-04-28"));
        System.out.println(changeDate("2018-04-23 12:12:12"));*/
        System.out.println(changeDate(getDate(Calendar.MONTH,new Date(),-6)));
    }
}
