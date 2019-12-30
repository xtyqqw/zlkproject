package com.zlk.zlkproject.course.exercises.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.course.courseHomePage.service.CourseHomePageService;
import com.zlk.zlkproject.course.exercises.service.ExercisesManagerService;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Exercises;
import com.zlk.zlkproject.entity.Section;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 习题控制类
 * @author: zyx
 * @create: 2019-12-20 13:50
 */
@Controller
@RequestMapping(value = "/exercisesManager")
public class ExercisesManagerController {

    @Autowired
    private CourseHomePageService courseHomePageService;
    @Autowired
    private ExercisesManagerService exercisesManagerService;
    @Autowired
    private LogUtil logUtil;
    @Autowired
    private ChapterService chapterService;
    @Autowired
    private SectionService sectionService;

    /** 跳转至章节管理页面*/
    @RequestMapping(value = "/toExercisesManager")
    public ModelAndView toChapterManager() throws Exception{
        List<Courses> coursesList = courseHomePageService.findAllCourses();
        ModelAndView mv = new ModelAndView();
        mv.addObject("coursesList",coursesList);
        mv.setViewName("admin/exercisesManager");
        return mv;
    }

    /**
     *  添加习题
     *@method insertExercises
     *@params [exercises]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  15:14
     */
    @RequestMapping(value = "/insertExercises",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insertExercises(Exercises exercises) throws Exception{
        Integer integer = exercisesManagerService.insertExercises(exercises);
        String message = "";
        if (integer >0){
            message = "添加成功";
        }
        Map<String,Object> map = new HashMap<>();
        map.put("msg",message);
        return map;
    }

    /**
     *  修改习题
     *@method updateExercises
     *@params [request, exercises]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  15:14
     */
    @RequestMapping(value = "/updateExercises",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateExercises(HttpServletRequest request, Exercises exercises) throws Exception{
        Integer integer = exercisesManagerService.updateExercisesByEId(exercises);
        String message = "";
        if (integer >0){
            message = "修改成功";
        }
        logUtil.setLog(request,"修改了习题id为"+exercises.getEId()+"的信息");
        Map<String,Object> map = new HashMap<>();
        map.put("msg",message);
        return map;
    }

    /**
     *  删除习题
     *@method deleteExercises
     *@params [request, eId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  15:15
     */
    @RequestMapping(value = "/deleteExercises",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteExercises(HttpServletRequest request, Integer eId) throws Exception{
        Exercises exercises = exercisesManagerService.selectExercisesByEId(eId);
        List<Exercises> exercisesList = exercisesManagerService.selectExerciseNumBySectionId(exercises.getSectionId());
        for (Exercises exe:exercisesList){
            if(exercises.getExerciseNum()<exe.getExerciseNum()){
                exe.setExerciseNum(exe.getExerciseNum()-1);
                exercisesManagerService.updateExercisesByEId(exe);
            }
        }
        Integer integer = exercisesManagerService.deleteByEId(eId);
        String message = "";
        if (integer >0){
            message = "删除成功";
            logUtil.setLog(request,"删除了问题id为"+eId+"的信息");
        }
        Map<String,Object> map = new HashMap<>();
        map.put("msg",message);
        return map;
    }

    /**
     *  查找全部并分页
     *@method selectAll
     *@params [page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  15:15
     */
    @RequestMapping(value = "/selectAll",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectAll(Integer page, Integer limit) throws Exception{
        List<Exercises> exercisesList = exercisesManagerService.selectAllAndLimit(page, limit);
        Integer count = exercisesManagerService.selectAllCount();
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",exercisesList);
        return map;
    }

    /**
     *  根据课程显示问题
     *@method selectByCoursesId
     *@params [coursesId, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  16:30
     */
    @RequestMapping(value = "/selectByCoursesId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectByCoursesId(Integer coursesId,Integer page, Integer limit) throws Exception{
        List<Exercises> exercisesList = exercisesManagerService.selectByCoursesId(coursesId,page, limit);
        Integer count = exercisesManagerService.selectCountByCoursesId(coursesId);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",exercisesList);
        return map;
    }

    /**
     *  根据章节显示问题
     *@method selectByChapterId
     *@params [chapterId, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  16:30
     */
    @RequestMapping(value = "/selectByChapterId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectByChapterId(Integer chapterId,Integer page, Integer limit) throws Exception{
        List<Exercises> exercisesList = exercisesManagerService.selectByChapterId(chapterId,page, limit);
        Integer count = exercisesManagerService.selectCountByCoursesId(chapterId);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",exercisesList);
        return map;
    }

    /**
     *  根据小节显示问题
     *@method selectBySectionId
     *@params [sectionId, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  16:30
     */
    @RequestMapping(value = "/selectBySectionId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectBySectionId(Integer sectionId,Integer page, Integer limit) throws Exception{
        List<Exercises> exercisesList = exercisesManagerService.selectBySectionId(sectionId,page, limit);
        Integer count = exercisesManagerService.selectCountBySectionId(sectionId);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",exercisesList);
        return map;
    }

    /**
     *  根据课程查找章节
     *@method selectChapterByCoursesId
     *@params [coursesId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  15:58
     */
    @RequestMapping(value = "/selectChapterByCoursesId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectChapterByCoursesId(Integer coursesId) throws Exception{
        List<Chapter> chapterList = chapterService.selectChapterByCoursesId(coursesId);
        Map<String,Object> map = new HashMap<>();
        map.put("chapterList",chapterList);
        return map;
    }

    /**
     *  根据章节查找小节
     *@method findSectionByChapterId
     *@params [chapterId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/20  16:43
     */
    @RequestMapping(value = "/findSectionByChapterId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findSectionByChapterId(Integer chapterId) throws Exception{
        List<Section> sectionList = sectionService.findSectionByChapterId(chapterId);
        Map<String,Object> map = new HashMap<>();
        map.put("sectionList",sectionList);
        return map;
    }


    /**
     *  根据小节id查找当前章节下的全部小节id和名称
     *@method findAllIdBySectionId
     *@params [sectionId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/23  10:41
     */
    @RequestMapping(value = "/findAllIdBySectionId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findAllIdBySectionId(Integer sectionId) throws Exception{
        List<Section> sectionList = sectionService.findAllIdBySectionId(sectionId);
        Map<String,Object> map = new HashMap<>();
        map.put("sectionList",sectionList);
        return map;
    }

    /**
     *  查找当前小节的习题序号
     *@method selectExerciseNumBySectionId
     *@params [sectionId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/23  16:38
     */
    @RequestMapping(value = "/selectExerciseNumBySectionId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectExerciseNumBySectionId(@RequestParam Integer sectionId) throws Exception{
        List<Exercises> exercisesList = exercisesManagerService.selectExerciseNumBySectionId(sectionId);
        List<Integer> exerciseNumList = new ArrayList<>();
        for (Exercises exercises:exercisesList ){
            exerciseNumList.add(exercises.getExerciseNum());
        }
        Integer count = exercisesManagerService.selectCountBySectionId(sectionId);
        Integer count1 = count + 1;
        Map<String,Object> map = new HashMap<>();
        map.put("exerciseNumList",exerciseNumList);
        map.put("count1",count1);
        return map;
    }



}
