package com.zlk.zlkproject.course.type.mapper;

import com.zlk.zlkproject.entity.Type;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface TypeKeMapper {

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
