package com.zlk.zlkproject.course.courseHomePage.service;


import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;

import java.util.List;




public interface CourseHomePageService {
    /**
     *@Author luanke
     *@Description //根据Id查询
     *@Date 19:25 2019/11/21
     *@Param [coursesId]
     *@return com.zlk.zlkproject.entity.Courses
    **/
    Courses selectCoursesByCoursesId(Integer coursesId);


    /**
     *@Author luanke
     *@Description //查询所有
     *@Date 19:25 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
    **/
    List<Courses> findCoursesList(Pagination pagination);

    /**
     *@Author luanke
     *@Description //多表查询所有内容和时间
     *@Date 11:01 2019/11/23
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
     **/
    List<Courses> findUserCoursesList(Pagination pagination);


    Integer findCoursesCount(Pagination pagination);
    /**
     * 修改数据
     *
     * @param courses 实例对象
     * @return 影响行数
     */
    int updateByCoursesId(Courses courses);
}
