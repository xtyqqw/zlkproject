package com.zlk.zlkproject.user.until;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @program: LeaveTime
 * @description: 计算距今时间工具类
 * @author: xty
 * @create: 2019/11/27 15:07
 **/
public class LeaveTime {
    public static String leaveTime(Date date){
        Date nDate = new Date();
        long l = (nDate.getTime()-date.getTime())/3600000;
        if(l>=24){
            l = l/24;
            return l+"天";
        }else {
            return l+"小时";
        }
    }

    public static String formatDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String n = sdf.format(date);
        return n;
    }
    public static String alterDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
        String n = sdf.format(date);
        return n;
    }
    public static void main(String[] args){
        Date date = new Date();
        long l = date.getTime()/1000;
        int i = (int)l;
        System.out.println(i);
        System.out.println(l+"天");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String b = sdf.format(null);
        String n = sdf.format(date);
        System.out.println("123");
        System.out.println(n);
    }
}
