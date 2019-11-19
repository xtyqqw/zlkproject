package com.zlk.zlkproject.course.courseHomePage.mapper;

import com.zlk.zlkproject.course.entity.Courses;

/**
 * @ClassName CourseHomePageMapper
 * @Description:
 * @Author LuanKe
 * Date 2019/11/19 16:33
 **/
public interface CourseHomePageMapper {
    Courses selectCoursesByCoursesId(Integer coursesId);

}

