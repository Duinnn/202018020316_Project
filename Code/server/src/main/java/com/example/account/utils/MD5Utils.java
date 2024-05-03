package com.example.account.utils;

import sun.misc.BASE64Encoder;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

public class MD5Utils {

    /** 利用MD5进行加密 */
    public static String EncoderByMd5(String str) {
        if (str == null) {
            throw new IllegalArgumentException("Input string cannot be null.");
        }

        String newStr = null;
        try {
            // 确定计算方法
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            BASE64Encoder base64en = new BASE64Encoder();
            // 加密后的字符串
            newStr = base64en.encode(md5.digest(str.getBytes(StandardCharsets.UTF_8)));
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newStr;
    }
}
