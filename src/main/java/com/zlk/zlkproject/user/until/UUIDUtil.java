package com.zlk.zlkproject.user.until;

/**
 * @program: UUIDUtil
 * @description: 获取UUID的工具类
 * @author: xty
 * @create: 2019/11/21 9:10
 **/
import java.util.UUID;
public class UUIDUtil {
    public static String getUUID() {
        return UUID.randomUUID().toString().replace("-", "");
    }
}
