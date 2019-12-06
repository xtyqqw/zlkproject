package com.zlk.zlkproject.course.courseHomePage.service.impl;

import com.zlk.zlkproject.course.courseHomePage.mapper.CourseHomePageMapper;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName CourseHomePageServiceImpl
 * @Description: 接口实现
 * @Author LuanKe
 * Date 2019/11/19 16:31
 **/
@Service
public class CourseHomePageServiceImpl implements CourseHomePageService{

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
    public List<Courses> findUserCoursesList(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return courseHomePageMapper.findUserCoursesList(pagination);
    }

    @Override
    public Integer findCoursesCount(Pagination pagination) {

        return courseHomePageMapper.findCoursesCount(pagination);
    }

    @Override
    public List<Courses> findAll(Courses courses, Integer page, Integer limit) {
        courses.getLastStudyTime();

        Integer startPage = (page - 1) * limit;
        return courseHomePageMapper.findAll(courses, startPage, limit);
    }
    @Override
    public int updateByCoursesId(Courses courses) {
        return courseHomePageMapper.updateByCoursesId(courses);

    }

    @Override
    public List<Courses> selectCoursesByLimit(Integer page, Integer limit) {
        Integer offset = (page-1)*limit;
        return courseHomePageMapper.selectCoursesByLimit(offset, limit);
    }

    @Override
    public Integer selectCount() {
        return courseHomePageMapper.selectCount();
    }

    @Override
    public int deleteByCoursesId(Integer coursesId) {
        return courseHomePageMapper.deleteByCoursesId(coursesId);
    }

    @Override
    public int insertByCourses(Courses courses) {
        return courseHomePageMapper.insertByCourses(courses);
    }

    @Override
    public List<Courses> findByCoursesNameLimit(String coursesName,Integer page,Integer limit) {
        Integer startPage = (page-1)*limit;
        return courseHomePageMapper.findByCoursesNameLimit(coursesName,startPage,limit);
    }

    @Override
    public Integer findCountsByCoursesName(String coursesName) {
        return courseHomePageMapper.findCountsByCoursesName(coursesName);
    }
}
