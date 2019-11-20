package com.zlk.zlkproject.course.courseHomePage.service.impl;

import com.zlk.zlkproject.course.courseHomePage.mapper.CourseHomePageMapper;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;
import com.zlk.zlkproject.course.entity.Courses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName CourseHomePageServiceImpl
 * @Description: 接口实现
 * @Author LuanKe
 * Date 2019/11/19 16:31
 **/
@Service
public class CourseHomePageServiceImpl implements CourseHomePageService {

    @Autowired
    private CourseHomePageMapper courseHomePageMapper;

    @Override
    public Courses selectCoursesByCoursesId(Integer coursesId) {
        return courseHomePageMapper.selectCoursesByCoursesId(coursesId);
    }
}
