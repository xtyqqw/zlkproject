package com.zlk.zlkproject.course.stuQa.mapper;

import com.zlk.zlkproject.entity.StuQa;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;


@Component
@Mapper
public interface StuQaMapper {

    /**
     *  添加新的问答
     *@method insertStuQa
     *@params [stuQa]
     *@return java.lang.Integer
     *@author zhangyouxin
     *@time 2019/11/27  15:12
     */
    Integer insertStuQa(StuQa stuQa);

    /**
     *  添加问答标签关联信息
     *@method insertStuQaTag
     *@params [sqaId, tagId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/11/27  15:17
     */
    Integer insertStuQaTag(Integer sqaId,Integer tagId);
}
