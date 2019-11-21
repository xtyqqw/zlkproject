package com.zlk.zlkproject.course.courseHomePage.service;


import com.zlk.zlkproject.entity.Courses;
import org.springframework.stereotype.Service;



public interface CourseHomePageService {
    Courses selectCoursesByCoursesId(Integer coursesId);
}
