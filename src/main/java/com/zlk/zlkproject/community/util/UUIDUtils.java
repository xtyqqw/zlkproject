package com.zlk.zlkproject.community.util;

import java.util.UUID;

/**
 * @program: UUIDUtils
 * @description: 主键生成器
 * @author: QianKeQin
 * @return 10位或9位的UUID
 * @date: 2019/11/20 10:07
 */
public class UUIDUtils {

    public static String getId(){
        String id = null;
        UUID uuid = UUID.randomUUID();
        id = uuid.toString();
        //去掉随机ID的短横线
        id = id.replaceAll("-", "");
        //将随机ID换成数字
        int num = id.hashCode();
        //去绝对值
        num = num < 0 ? -num : num;
        //将这个数字转化为String
        id = String.valueOf(num);
        return id;
    }
}
