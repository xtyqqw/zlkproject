package com.zlk.zlkproject.course.courseHomePage.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;
import com.zlk.zlkproject.course.type.service.TypeKeService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Type;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 后台课程管理控制器
 * @author: zyx
 * @create: 2019-12-09 15:23
 */
@Controller
@RequestMapping(value = "/courseManager")
public class CoursesManagerController {

    @Autowired
    private LogUtil logUtil;

    @Autowired
    private CourseHomePageService courseHomePageService;
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private TypeKeService typeKeService;

    /**
     * 跳转到课程管理页面
     * @return
     */
    @RequestMapping("/toCourseManager")
    public ModelAndView toCourseManager() throws Exception{
        List<Type> typeList = typeKeService.selectAll();
        ModelAndView mv = new ModelAndView();
        mv.addObject("typeList",typeList);
        mv.setViewName("view/CourseManager");
        return mv;
    }

    /**
     * 查询全部并分页
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping(value = "/findAllByLimit" )
    @ResponseBody
    public Map findAllByLimit(Integer page, Integer limit){
        List<Courses> coursesList = courseHomePageService.selectCoursesByLimit(page, limit);
        for (Courses courses : coursesList) {
            Integer chapterNum = chapterService.selectCountByCoursesId(courses.getCoursesId());
            Integer sectionNum = chapterService.selectSumSectionByCoursesId(courses.getCoursesId());
            courses.setChapterNum(chapterNum);
            courses.setSectionNum(sectionNum);
            courseHomePageService.updateByCoursesId(courses);
        }
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",courseHomePageService.selectCount());
        map.put("data",coursesList);
        return map;
    }

    /**
     * 删除数据的方法
     * @param courseId
     * @return
     */
    @RequestMapping(value = "/deleteByCourseId" )
    @ResponseBody
    public Map<String,Object> deleteByCourseId(HttpServletRequest request, Integer courseId){
        int i = courseHomePageService.deleteByCoursesId(courseId);
        String message ="";
        if (i>0){
            message = "删除成功";
            logUtil.setLog(request,"删除了课程id为"+courseId+"的信息");
        }
        Map<String,Object> map=new HashMap<>();
        map.put("message",message);
        return map;
    }

    /**
     * 新增数据的方法
     * @param courses
     * @return 课程管理页面
     */
    @RequestMapping(value = "/insertByCourse" )
    public Map<String,Object> insertByCourse(Courses courses){
        System.out.println(courses.getCoursesTagId());
        int i = courseHomePageService.insertByCourses(courses);
        String message = "";
        if (i>0){
            message = "新增成功";
        }
        Map<String,Object> map=new HashMap<>();
        map.put("message",message);
        return map;
    }

    /**
     *  根据课程名称模糊查询课程信息
     *@method findByCoursesNameLimit
     *@params [coursesName, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/4  14:43
     */
    @RequestMapping(value = "/findByCoursesNameLimit")
    @ResponseBody
    public Map<String, Object> findByCoursesNameLimit(@RequestParam String coursesName, Integer page, Integer limit) throws Exception {
        List<Courses> coursesList = courseHomePageService.findByCoursesNameLimit(coursesName,page,limit);
        Integer counts = courseHomePageService.findCountsByCoursesName(coursesName);
        Map<String, Object> map = new HashMap<>();
        map.put("code", 0);
        map.put("msg","");
        map.put("count",counts);
        map.put("data",coursesList);
        return map;
    }

    /**
     *  表单图片上传
     *@method uploadPic
     *@params [file]
     *@return java.util.Map
     *@author zhang
     *@time 2019/12/4  17:29
     */
    @RequestMapping("/uploadPic")
    @ResponseBody
    public Map uploadPic(@RequestParam(name = "file") MultipartFile file) throws Exception{
        Map<String,Object> map=new HashMap<>();
        String path = commonFileUtil.uploadFile(file);
        String url = fdfsConfig.getResHost()+":"+fdfsConfig.getStoragePort()+path;
        map.put("url",url);
        map.put("message","上传成功");
        return map;
    }

    @RequestMapping(value = "/updateCourses",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateCourses(HttpServletRequest request,Courses courses) throws Exception{
        int i = courseHomePageService.updateByCoursesId(courses);
        String message ="";
        if (i>0){
            message = "修改成功";
            logUtil.setLog(request,"修改了课程名为"+courses.getCoursesName()+"的信息");
        }
        Map<String,Object> map=new HashMap<>();
        map.put("mmm",message);
        return map;
    }

    @RequestMapping(value = "/findAllCourses",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findAllCourses() throws Exception{
        List<Courses> coursesList = courseHomePageService.findAllCourses();
        Map<String,Object> map=new HashMap<>();
        map.put("coursesList",coursesList);
        return map;
    }

}
