package com.zlk.zlkproject.course.courseHomePage.service.impl;

import com.zlk.zlkproject.course.courseHomePage.mapper.CourseHomePageMapper;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName CourseHomePageServiceImpl
 * @Description: 接口实现
 * @Author LuanKe
 * Date 2019/11/19 16:31
 **/
@Service
public class CourseHomePageServiceImpl implements CourseHomePageService {

    @Autowired(required = false)
    private CourseHomePageMapper courseHomePageMapper;

    @Override
    public Courses selectCoursesByCoursesId(Integer coursesId) {
        return courseHomePageMapper.selectCoursesByCoursesId(coursesId);
    }

    @Override
    public List<Courses> findCoursesList(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return courseHomePageMapper.findCoursesList(pagination);
    }

    @Override
    public Integer findCoursesCount(Pagination pagination) {
        return courseHomePageMapper.findCoursesCount(pagination);
    }
}
