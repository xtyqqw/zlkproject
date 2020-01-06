package com.zlk.zlkproject.user.until;

import com.zlk.zlkproject.user.entity.MyQuestions;
import com.zlk.zlkproject.user.entity.MyResponse;

import java.text.SimpleDateFormat;
import java.util.*;

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
            return l+"天前";
        }else {
            return l+"小时前";
        }
    }

    public static String formatDate(Date date){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
        String n = sdf.format(date);
        return n;
    }
    public static String alterDate(Date date) {
        if (date!=null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd ");
            String n = sdf.format(date);
            return n;
        }
        return "未知时间";
    }
    public static List byTime(List list){
        Collections.sort(list, new Comparator() {
            public int compare(Object o1, Object o2) {
                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                java.util.Date dt1;
                java.util.Date dt2;
                try {
                    if(MyQuestions.class.isInstance(o1)){
                        dt1 = ((MyQuestions)o1).getCreateTime();
                    }else {
                        dt1 = ((MyResponse)o1).getCreateTime();
                    }
                    if(MyQuestions.class.isInstance(o2)){
                        dt2 = ((MyQuestions)o2).getCreateTime();
                    }else {
                        dt2 = ((MyResponse)o2).getCreateTime();
                    }

                    if (dt1.getTime() < dt2.getTime()) {
                        return 1;
                    } else if (dt1.getTime() > dt2.getTime()) {
                        return -1;
                    } else {
                        return 0;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
                return 0;
            }
        });
        return list;
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
        List list = new ArrayList();
        Date d1 = new Date();
        Date d2 = new Date();


    }
}
