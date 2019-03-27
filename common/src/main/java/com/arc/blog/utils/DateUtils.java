package com.arc.blog.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

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

}
