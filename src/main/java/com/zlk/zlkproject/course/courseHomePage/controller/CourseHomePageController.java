package com.zlk.zlkproject.course.courseHomePage.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
    private LogUtil logUtil;

    @Autowired
    private CourseHomePageService courseHomePageService;

    @RequestMapping(value = "/selectCoursesByCoursesId")
    @ResponseBody
    public Map<String,Object> selectCoursesByCoursesId(HttpServletRequest request,Integer coursesId) {
        coursesId = (Integer) request.getSession().getAttribute("coursesId");
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

    /**
     * 根据课程对象为条件查询并分页
     * @param courses
     * @param page
     * @param limit
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAll")
    @ResponseBody
    public Map<String,Object> findAll(Courses courses,Integer page,Integer limit)throws Exception{
        List<Courses> allList=courseHomePageService.findAll(courses,page,limit);
        Map<String,Object> map=new HashMap<>();

        map.put("allList",allList);
        return map;
    }

    /**
     * 查询全部并分页
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/findAllByLimit" )
    @ResponseBody
    public Map findAllByLimit(Integer page,Integer limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",courseHomePageService.selectCount());
        map.put("data",courseHomePageService.selectCoursesByLimit(page, limit));
        return map;
    }

    /**
     * 删除数据的方法
     * @param courseId
     * @return
     */
    @RequestMapping(value = "/deleteByCourseId" )
    @ResponseBody
    public Integer deleteByCourseId(Integer courseId, HttpServletRequest request){
        logUtil.setLog(request,"删除了课程id为"+courseId+"的信息");
        return courseHomePageService.deleteByCoursesId(courseId);
    }

    /**
     * 新增数据的方法
     * @param courses
     * @return 课程管理页面
     */
    @RequestMapping(value = "/insertByCourse" )
    public String insertByCourse(Courses courses){
        int i = courseHomePageService.insertByCourses(courses);
        if (i>0){
            return "/view/toCourseManager";
        }
        return "新增成功";
    }
}
