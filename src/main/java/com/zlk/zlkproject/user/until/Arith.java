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
            Integer y = x * 5;
            return y;
        }else {
            return 0;
        }
    }

}
