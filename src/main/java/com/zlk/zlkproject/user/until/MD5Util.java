package com.zlk.zlkproject.user.until;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * @program: MD5Util
 * @description: MD5加密工具类
 * @author: xty
 * @create: 2019/11/21 9:11
 **/
public class MD5Util {
    public static String md5Encrypt32Lower(String string) {
        byte[] hash;
        try {
            //创建一个MD5算法对象，并获得MD5字节数组,16*8=128位
            hash = MessageDigest.getInstance("MD5").digest(string.getBytes("UTF-8"));
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Huh, MD5 should be supported?", e);
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("Huh, UTF-8 should be supported?", e);
        }
        //转换为十六进制字符串
        StringBuilder hex = new StringBuilder(hash.length * 2);
        for (byte b : hash) {
            if ((b & 0xFF) < 0x10) hex.append("0");
            hex.append(Integer.toHexString(b & 0xFF));
        }
        return hex.toString().toLowerCase();
    }

    public static void main(String[] args) {
        String a = md5Encrypt32Lower("1");
        System.out.println(a);
    }
}
