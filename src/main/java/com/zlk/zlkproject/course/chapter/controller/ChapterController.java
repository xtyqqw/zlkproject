package com.zlk.zlkproject.course.chapter.controller;

import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 章节控制类
 * @author: zyx
 * @create: 2019-11-19 14:09
 */
@Controller
@RequestMapping(value = "/chapter")
public class ChapterController {

    @Autowired
    private ChapterService chapterService;

    /**
     *  查找所有目录信息
     *@method findChapters
     *@params [coursesId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/11/22  15:06
     */
    @RequestMapping(value = "/findChapters")
    @ResponseBody
    public Map<String,Object> findChapters(HttpServletRequest request)throws Exception{
        Integer coursesId = 1;
//        request.getSession().getAttribute("coursesId");
        List<Chapter> chapters = chapterService.findChapterByCoursesId(coursesId);
        Map<String,Object> map = new HashMap<>();
        map.put("chapters",chapters);
        return map;
    }

    /** 跳转至章节管理页面*/
    @RequestMapping(value = "/toChapterManager")
    public String toChapterManager() throws Exception{
        return "view/ChapterManager";
    }

    /**
     *  添加章节
     *@method insertChapter
     *@params [chapter]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/5  11:17
     */
    @RequestMapping(value = "/insertChapter",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insertChapter(Chapter chapter) throws Exception{
        Integer integer = chapterService.insertChapter(chapter);
        String message = "";
        if (integer >0){
            message = "添加成功";
        }
        Map<String,Object> map = new HashMap<>();
        map.put("msg",message);
        return map;
    }

    /**
     *  修改章节
     *@method updateChapter
     *@params [chapter]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/5  11:19
     */
    @RequestMapping(value = "/updateChapter",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> updateChapter(Chapter chapter) throws Exception{
        Integer integer = chapterService.updateChapterByChapterId(chapter);
        String message = "";
        if (integer >0){
            message = "修改成功";
        }
        Map<String,Object> map = new HashMap<>();
        map.put("msg",message);
        return map;
    }

    /**
     *  删除章节
     *@method deleteChapter
     *@params [chapter]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/5  11:20
     */
    @RequestMapping(value = "/deleteChapter",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteChapter(Chapter chapter) throws Exception{
        Integer integer = chapterService.deleteByChapterId(chapter);
        String message = "";
        if (integer >0){
            message = "删除成功";
        }
        Map<String,Object> map = new HashMap<>();
        map.put("msg",message);
        return map;
    }

    /**
     *  查找全部章节信息
     *@method selectAll
     *@params [pagination]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/5  11:35
     */
    @RequestMapping(value = "/selectAll",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectAll(Pagination pagination) throws Exception{
        List<Chapter> chapterList = chapterService.selectAllAndLimit(pagination);
        Integer count = chapterService.selectAllCount();
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",chapterList);
        return map;
    }


    /**
     *  根据课程id查找当前课程全部章节
     *@method selectByCoursesId
     *@params [coursesId, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/5  11:35
     */
    @RequestMapping(value = "/selectByCoursesId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectByCoursesId(Integer coursesId,Integer page,Integer limit) throws Exception{
        List<Chapter> chapterList = chapterService.selectChapterByCoursesIdAndLimit(coursesId, page, limit);
        Integer count = chapterService.selectCountByCoursesId(coursesId);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",chapterList);
        return map;
    }

    @RequestMapping(value = "/selectByChapterName",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> selectByChapterName(@RequestParam String chapterName, Integer page, Integer limit) throws Exception{
        List<Chapter> chapterList = chapterService.selectByChapterName(chapterName, page, limit);
        Integer count = chapterService.selectCountsByChapterName(chapterName);
        Map<String,Object> map = new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        map.put("count",count);
        map.put("data",chapterList);
        return map;
    }
}
