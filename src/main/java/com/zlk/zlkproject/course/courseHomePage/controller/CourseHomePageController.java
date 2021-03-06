package com.zlk.zlkproject.course.courseHomePage.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.course.userSection.service.UserSectionService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
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
    private UserSectionService userSectionService;

    @Autowired
    private SectionService sectionService;

    @Autowired
    private CourseHomePageService courseHomePageService;
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;

    @RequestMapping(value = "/selectCoursesByCoursesId")
    @ResponseBody
    public Map<String,Object> selectCoursesByCoursesId(HttpServletRequest request,Integer coursesId) {
        coursesId = (Integer) request.getSession().getAttribute("coursesId");
        Courses courses=courseHomePageService.selectCoursesByCoursesId(coursesId);
        Map<String,Object> map=new HashMap<>();
        int starSum;
        int sectionCount;
        double ratio;
        if(userSectionService.querySumByCoursesId(coursesId)!=null){
            starSum = userSectionService.querySumByCoursesId(coursesId);
            sectionCount = sectionService.findCountByCourseId(coursesId);
            ratio = starSum/(sectionCount*3.0*courses.getStudentNum())*100;
        }else {
            starSum = 0;
            sectionCount = 0;
            ratio = 0;
        }
        map.put("courses",courses);
        map.put("ratio",(int)ratio);
        map.put("starSum",starSum);
        map.put("sectionCount",sectionCount);
        return map;
    }
    @RequestMapping(value = "/findCoursesList")
    @ResponseBody
    public Map<String,Object> findCoursesList(Pagination pagination)throws Exception{

        List<Courses> coursesList=courseHomePageService.findCoursesList(pagination);

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
     * 根据课程对象为条件查询并分页
     * @param courses
     * @param page
     * @param limit
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/findAllByTag")
    @ResponseBody
    public Map<String,Object> findAllByTag(Courses courses,String tagName,Integer page,Integer limit,HttpServletRequest request)throws Exception{
        //tagName = (String) request.getSession().getAttribute("tagName");
        List<Courses> allListTag=courseHomePageService.findAllByTag(courses,tagName,page,limit);
        Map<String,Object> map=new HashMap<>();
        map.put("allListTag",allListTag);
        return map;
    }

    @RequestMapping(value = "/findAllByTag1")
    @ResponseBody
    public Map<String,Object> findAllByTag1(Courses courses,HttpServletRequest request,Integer page,Integer limit)throws Exception{
        String tagName = (String) request.getSession().getAttribute("tagName");
        /*int page =1;
        int limit=8;*/
        List<Courses> allListTag=courseHomePageService.findAllByTag(courses,tagName,page,limit);
        Map<String,Object> map=new HashMap<>();
        map.put("allListTag",allListTag);
        return map;
    }





}
