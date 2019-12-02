package com.zlk.zlkproject.course.courseHomePage.controller;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName CourseHomePageController
 * @Description: 控制层
 * @Author LuanKe
 * Date 2019/11/19 16:33
 **/
@Controller
@RequestMapping(value="/courseHomePage")
public class CourseHomePageController {
    @Autowired
    private CourseHomePageService courseHomePageService;

    @RequestMapping(value = "/selectCoursesByCoursesId")
    @ResponseBody
    public Map<String,Object> selectCoursesByCoursesId(Integer coursesId) {
        Courses courses=courseHomePageService.selectCoursesByCoursesId(coursesId);
        System.out.println(courses);
        Map<String,Object> map=new HashMap<>();
        map.put("courses",courses);
        return map;
    }
    @RequestMapping(value = "/findCoursesList")
    @ResponseBody
    public Map<String,Object> findCoursesList(Pagination pagination)throws Exception{

        List<Courses> coursesList=courseHomePageService.findCoursesList(pagination);
        for(Courses courses:coursesList){
            System.out.println(courses.getCoursesId());
        }
        Map<String,Object> map=new HashMap<>();
        map.put("coursesList",coursesList);
        return map;
    }

    @RequestMapping(value = "/findUserCoursesList")
    @ResponseBody
    public Map<String,Object> findUserCoursesList(Pagination pagination)throws Exception{

        List<Courses> userCoursesList=courseHomePageService.findCoursesList(pagination);
        Map<String,Object> map=new HashMap<>();
        map.put("userCoursesList",userCoursesList);
        return map;

    }

}
