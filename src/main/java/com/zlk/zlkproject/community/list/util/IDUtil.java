package com.zlk.zlkproject.community.list.util;

import java.util.UUID;

/**
 * @program:IDUtil
 * @description:
 * @author:zj
 * @date:2019/11/19 10:01
 */
public class IDUtil {
    public static String getUUid() {
        String id = UUID.randomUUID().toString().replaceAll("-", "");
        return id;
    }
}
