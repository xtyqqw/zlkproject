package com.zlk.zlkproject.course.course_tag.mapper;

import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface CourseTagMapper {

    /**
     *  查找所有的标签
     *@method findAllTags
     *@params []
     *@return java.util.List<com.zlk.zlkproject.entity.Tag>
     *@author zhangyouxin
     *@time 2019/11/27  9:13
     */
    List<Tag> findAllTags();
}
