package com.zlk.zlkproject.course.courseHomePage.service;


import com.zlk.zlkproject.entity.Courses;


public interface CourseHomePageService {
    Courses selectCoursesByCoursesId(Integer coursesId);
}
