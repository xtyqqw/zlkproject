package com.zlk.zlkproject.community.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program:TimeFormatUtil
 * @description: 日期转换成时间戳
 * @author:zj
 * @date:2019/11/29 17:43
 */
public class TimeFormatUtil {
    public static String getSimpleTimeStamp(){
        return new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }
}
