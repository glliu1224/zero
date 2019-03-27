package com.arc.blog.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import static org.apache.commons.lang3.time.DateUtils.parseDate;

/**
 * @author 叶超
 * @since 2019/3/26 17:15
 */
public class DateUtils {

    public static Long getDayBegin() {
        Calendar cal = new GregorianCalendar();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime().getTime();
    }

    public static Long getDayEnd() {
        Calendar cal = new GregorianCalendar();
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        cal.set(Calendar.MILLISECOND, 999);
        return cal.getTime().getTime();
    }

    public static String getStringDate(Long dateTime) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = simpleDateFormat.format(new Date(dateTime));
        return dateString;
    }

    public static String getStringDate() {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = simpleDateFormat.format(new Date());
        return dateString;
    }

    public static Date getDate(String dateString) throws ParseException {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = simpleDateFormat.parse(dateString);
        return date;
    }

    public static String timeStamp2Date(Long time) {
//        Long timeLong = Long.parseLong(time);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");//要转换的时间格式
        Date date;
        try {
            date = sdf.parse(sdf.format(time));
            return sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String longFormatStr(Long time) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date;
        try {
            date = sdf.parse(sdf.format(time));
            return sdf.format(date);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @param value
     * @return
     * @Title: objectConvertBigDecimal
     * @Description: Object类型的数字转Date
     * @author: ZXM
     */
    public static String objectConvertDate(Object value) {
        String strDate = "";
        Long longDate = 0L;
        if (value != null) {
            if (value instanceof Long) {
                longDate = (Long) value;
            } else if (value instanceof String) {
                longDate = Long.valueOf((String) value);
            } else if (value instanceof Integer) {
                longDate = (Long) value;
            } else {
                throw new ClassCastException("Not possible to coerce [" + value + "] from class " + value.getClass()
                        + " into a Long.");
            }
        }
        strDate = longFormatStr(longDate);
        return strDate;
    }

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
