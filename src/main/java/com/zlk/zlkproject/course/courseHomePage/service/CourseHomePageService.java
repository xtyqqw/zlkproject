package com.zlk.zlkproject.course.courseHomePage.service;

import com.zlk.zlkproject.course.entity.Courses;
import org.springframework.stereotype.Service;

@Service
public interface CourseHomePageService {
    Courses selectCoursesByCoursesId(Integer coursesId);
}
