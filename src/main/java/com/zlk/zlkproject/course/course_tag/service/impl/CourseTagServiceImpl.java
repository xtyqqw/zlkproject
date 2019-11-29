package com.zlk.zlkproject.course.course_tag.service.impl;

import com.zlk.zlkproject.course.course_tag.mapper.CourseTagMapper;
import com.zlk.zlkproject.course.course_tag.service.CourseTagService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: zlkproject
 * @description: 标签业务实现类
 * @author: zyx
 * @create: 2019-11-27 09:21
 */
@Service
public class CourseTagServiceImpl implements CourseTagService {

    @Autowired
    private CourseTagMapper courseTagMapper;

    @Override
    public List<Tag> findAllTags() {
        return courseTagMapper.findAllTags();
    }
}
