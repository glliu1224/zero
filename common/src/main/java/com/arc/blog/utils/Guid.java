//package com.arc.blog.utils;
//
//import java.util.UUID;
//
///**
// * @author 叶超
// * @since 2019/3/27 10:35
// */
//public class Guid {
//
//    /// <summary>
///// 根据GUID获取唯一数字序列
///// </summary>
//    public static long GuidToInt64()
//    {
//        byte[] bytes = Guid.NewGuid().ToByteArray();
//        return BitConverter.ToInt64(bytes, 0);
//    }
//    /// <summary>
///// Generate a new <see cref="Guid"/> using the comb algorithm.
///// </summary>
//    private Guid GenerateComb()
//    {
//        byte[] guidArray = Guid.NewGuid().ToByteArray();
//
//        DateTime baseDate = new DateTime(1900, 1, 1);
//        DateTime now = DateTime.Now;
//
//        // Get the days and milliseconds which will be used to build
//        //the byte string
//        TimeSpan days = new TimeSpan(now.Ticks - baseDate.Ticks);
//        TimeSpan msecs = now.TimeOfDay;
//
//        // Convert to a byte array
//        // Note that SQL Server is accurate to 1/300th of a
//        // millisecond so we divide by 3.333333
//        byte[] daysArray = BitConverter.GetBytes(days.Days);
//        byte[] msecsArray = BitConverter.GetBytes((long)
//                (msecs.TotalMilliseconds / 3.333333));
//
//        // Reverse the bytes to match SQL Servers ordering
//        Array.Reverse(daysArray);
//        Array.Reverse(msecsArray);
//
//        // Copy the bytes into the guid
//        Array.Copy(daysArray, daysArray.Length - 2, guidArray,
//                guidArray.Length - 6, 2);
//        Array.Copy(msecsArray, msecsArray.Length - 4, guidArray,
//                guidArray.Length - 4, 4);
//
//        return new Guid(guidArray);
//    }
//
//    private static String NewGuid() {
//        UUID uuid = UUID.randomUUID();
//        return uuid.toString();
//    }
//}
