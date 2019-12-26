package com.zlk.zlkproject.user.until;


import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;
/**
 * @ClassName： ObjectConvertUtils
 * @Description： 类型转换工具类
 * @Author： yzh
 * @Date： 2019/12/23 17:50
 */
public class ObjectConvertUtils {


    /**
     * 把一个List<Object[]>转换成一个List<T>
     *
     * @param clz
     * @return
     * @throws Exception
     */

    public static <T> List<T> objectToBean(List<Object[]> objList, Class<T> clz) throws Exception {

        if (objList == null || objList.size() == 0) {

            return null;

        }


        Class<?>[] cz = null;

        Constructor<?>[] cons = clz.getConstructors();

        for (Constructor<?> ct : cons) {

            Class<?>[] clazz = ct.getParameterTypes();

            if (objList.get(0).length == clazz.length) {

                cz = clazz;

                break;

            }

        }


        List<T> list = new ArrayList<T>();

        for (Object[] obj : objList) {

            Constructor<T> cr = clz.getConstructor(cz);

            list.add(cr.newInstance(obj));

        }

        return list;

    }


}
