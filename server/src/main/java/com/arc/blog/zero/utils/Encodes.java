/**
 * Copyright (c) 2005-2012 springside.org.cn
 */
package com.arc.blog.zero.utils;

import com.arc.blog.zero.controller.data.poi.Exceptions;
import org.apache.commons.codec.DecoderException;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 封装各种格式的编码解码工具类.
 * 1.Commons-Codec的 hex/base64 编码
 * 2.自制的base62 编码
 * 3.Commons-Lang的xml/html escape
 * 4.JDK提供的URLEncoder
 *
 * @author calvin
 * @version 2013-01-15
 */
public class Encodes {

    private static final String DEFAULT_URL_ENCODING = "UTF-8";
    private static final char[] BASE62 = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz".toCharArray();

    /**
     * Hex编码.
     */
    public static String encodeHex(byte[] input) {
        return new String(Hex.encodeHex(input));
    }

    /**
     * Hex解码.
     */
    public static byte[] decodeHex(String input) {
        try {
            return Hex.decodeHex(input.toCharArray());
        } catch (DecoderException e) {
            throw Exceptions.unchecked(e);
        }
    }

    /**
     * Base64编码.
     */
    public static String encodeBase64(byte[] input) {
        return new String(Base64.encodeBase64(input));
    }

    /**
     * Base64编码.
     */
    public static String encodeBase64(String input) {
        try {
            return new String(Base64.encodeBase64(input.getBytes(DEFAULT_URL_ENCODING)));
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }

//	/**
//	 * Base64编码, URL安全(将Base64中的URL非法字符'+'和'/'转为'-'和'_', 见RFC3548).
//	 */
//	public static String encodeUrlSafeBase64(byte[] input) {
//		return Base64.encodeBase64URLSafe(input);
//	}

    /**
     * Base64解码.
     */
    public static byte[] decodeBase64(String input) {
        return Base64.decodeBase64(input.getBytes());
    }

    /**
     * Base64解码.
     */
    public static String decodeBase64String(String input) {
        try {
            return new String(Base64.decodeBase64(input.getBytes()), DEFAULT_URL_ENCODING);
        } catch (UnsupportedEncodingException e) {
            return "";
        }
    }

    /**
     * Base62编码。
     */
    public static String encodeBase62(byte[] input) {
        char[] chars = new char[input.length];
        for (int i = 0; i < input.length; i++) {
            chars[i] = BASE62[((input[i] & 0xFF) % BASE62.length)];
        }
        return new String(chars);
    }

//	/**
//	 * Html 转码.
//	 */
//	public static String escapeHtml(String html) {
//		return StringEscapeUtils.escapeHtml4(html);
//	}

//	/**
//	 * Html 解码.
//	 */
//	public static String unescapeHtml(String htmlEscaped) {
//		return StringEscapeUtils.unescapeHtml4(htmlEscaped);
//	}
//
//	/**
//	 * Xml 转码.
//	 */
//	public static String escapeXml(String xml) {
//		return StringEscapeUtils.escapeXml10(xml);
//	}
//
//	/**
//	 * Xml 解码.
//	 */
//	public static String unescapeXml(String xmlEscaped) {
//		return StringEscapeUtils.unescapeXml(xmlEscaped);
//	}

    /**
     * URL 编码, Encode默认为UTF-8.
     */
    public static String urlEncode(String part) {
        try {
            return URLEncoder.encode(part, DEFAULT_URL_ENCODING);
        } catch (UnsupportedEncodingException e) {
            throw Exceptions.unchecked(e);
        }
    }

    /**
     * URL 解码, Encode默认为UTF-8.
     */
    public static String urlDecode(String part) {

        try {
            return URLDecoder.decode(part, DEFAULT_URL_ENCODING);
        } catch (UnsupportedEncodingException e) {
            throw Exceptions.unchecked(e);
        }
    }


    /**
     * 提取短信中的验证码（6位数字）
     *
     * @param sms
     * @return
     */
    private static String getNumber(String sms) {
        if (null != sms && !"".equals(sms.trim())) {
            int start = sms.indexOf("领取码") + 3;
              sms = sms.substring(start, start + 9);
            System.out.println(sms);
            System.out.println(sms);
            System.out.println(sms);
            System.out.println(sms);
            return sms;
        }
        return null;
    }

    public static void main(String[] args) {
        String txt = "【绿城服务】您的快递中通75141140352055已送达，请凭领取码169349891到上海保集澜苑上海保集澜苑右边取件。";
        String number = getNumber(txt);
        System.out.println(number);
        int start = txt.indexOf("领取码") + 4;
        System.out.println(start);


        System.out.println(start);
        System.out.println(start);
        System.out.println(start);
        System.out.println("【绿城服务】您的快递中通75141140352055已送达，请凭领取码".length());
        System.out.println("【绿城服务】您的快递中通75141140352055已送达，请凭领取码169349891".length());
        System.out.println("75141140352055".length());
        System.out.println("169349891".length());
    }

}
