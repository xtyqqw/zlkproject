package com.zlk.zlkproject.course.courseHomePage.mapper;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @ClassName CourseHomePageMapper
 * @Description:
 * @Author LuanKe
 * Date 2019/11/19 16:33
 **/
@Mapper
public interface CourseHomePageMapper {
    /**
     *@Author luanke
     *@Description //根据Id查询表
     *@Date 19:15 2019/11/21
     *@Param [coursesId]
     *@return com.zlk.zlkproject.entity.Courses
    **/
    Courses selectCoursesByCoursesId(Integer coursesId);

    /**
     *@Author luanke
     *@Description //查询所有
     *@Date 19:16 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
    **/
    List<Courses> findCoursesList(Pagination pagination);

    Integer findCoursesCount(Pagination pagination);

}

