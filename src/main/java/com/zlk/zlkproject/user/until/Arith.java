package com.zlk.zlkproject.user.until;

import java.math.BigDecimal;

/**
 * @ClassName： Arith
 * @Description：
 * @Author： sd
 * @Date： 2019/11/22 10:07
 */
public class Arith {
    private static final int DEF_DIV_SCALE = 10; // 这个类不能实例化

    private Arith() {
    }


    public static Integer add(Integer x) {
        if (x!=null) {
            Integer y = (x * 5)+ 3;
            return y;
        }else {
            return null;
        }
    }
    public static Integer acc(Integer c){
        if(c != null){
            Integer a = (c + 1) * 3;
            return a;
        }else {
            return null;
        }
    }
    public static Integer abb(Integer b,Integer q){
        /*除法*/
        Integer h=(b*100)/q;
        if(q!=0){
        return h;
        }else {
            return null;
        }
    }

}
