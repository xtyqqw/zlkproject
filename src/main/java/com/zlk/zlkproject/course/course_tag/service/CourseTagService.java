package com.zlk.zlkproject.course.course_tag.service;

import com.zlk.zlkproject.entity.Tag;

import java.util.List;

public interface CourseTagService {

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
