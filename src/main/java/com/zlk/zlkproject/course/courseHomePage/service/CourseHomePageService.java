package com.zlk.zlkproject.course.courseHomePage.service;


import com.zlk.zlkproject.entity.Courses;
<<<<<<< HEAD
import com.zlk.zlkproject.entity.Pagination;

import java.util.List;
=======
import org.springframework.stereotype.Service;

>>>>>>> 35ddf71367b40286d642dc458630a7baebac8939


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

    Integer findCoursesCount(Pagination pagination);
}
