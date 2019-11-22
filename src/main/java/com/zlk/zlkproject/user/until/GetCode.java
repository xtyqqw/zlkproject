package com.zlk.zlkproject.user.until;

import java.util.Random;

/**
 * @program: GetCode
 * @description: 获取随机验证码工具类
 * @author: xty
 * @create: 2019/11/19 14:00
 **/
public class GetCode {
    public String getCode(){
        Random rm = new Random();
        String code = "";
        Integer c = 0;
        for(int i = 0 ; i < 6;i++){
            c = rm.nextInt(10);
            code = code +c.toString();
        }

        return code;
    }
}
