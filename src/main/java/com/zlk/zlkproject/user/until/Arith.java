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


    public static Integer ride(Integer x) {
        if (x!=null) {
            Integer y = (x * 5)+ 3;
            return y;
        }else {
            return null;
        }
    }
    public static Integer plus(Integer c){
        if(c != null){
            Integer a = (c + 1) * 3;
            return a;
        }else {
            return null;
        }
    }
    public static Integer divide(Integer b,Integer q){
        /*除法*/

        if(q!=0){
            Integer h=100-(b*100)/q;
            return h;
        }else {
            return null;
        }
    }

}
