package com.zlk.zlkproject.course.type.service;

import com.zlk.zlkproject.entity.Type;

import java.util.List;

public interface TypeKeService {

    /**
     *  查找全部type
     *@method selectAll
     *@params []
     *@return java.util.List<com.zlk.zlkproject.entity.Type>
     *@author zhang
     *@time 2019/12/11  15:32
     */
    List<Type> selectAll();
}
