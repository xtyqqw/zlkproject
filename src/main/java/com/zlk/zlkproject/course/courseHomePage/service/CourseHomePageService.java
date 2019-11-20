package com.zlk.zlkproject.course.courseHomePage.service;

import com.zlk.zlkproject.course.entity.Courses;



public interface CourseHomePageService {
    Courses selectCoursesByCoursesId(Integer coursesId);
}
