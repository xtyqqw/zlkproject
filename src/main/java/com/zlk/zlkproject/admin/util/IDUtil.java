package com.zlk.zlkproject.admin.util;

import java.util.UUID;

public class IDUtil {
    public static String getUUID() {
        String id = UUID.randomUUID().toString().replaceAll("-", "");
        return id;
    }
}
