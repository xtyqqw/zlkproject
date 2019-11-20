package com.zlk.zlkproject.course.courseHomePage.mapper;

import com.zlk.zlkproject.entity.Courses;
import org.apache.ibatis.annotations.Mapper;

/**
 * @ClassName CourseHomePageMapper
 * @Description:
 * @Author LuanKe
 * Date 2019/11/19 16:33
 **/
@Mapper
public interface CourseHomePageMapper {
    Courses selectCoursesByCoursesId(Integer coursesId);

}

