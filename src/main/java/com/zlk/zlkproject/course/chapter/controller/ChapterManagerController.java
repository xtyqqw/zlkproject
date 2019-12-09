package com.zlk.zlkproject.course.chapter.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 后台管理章节控制器
 * @author: zyx
 * @create: 2019-12-09 13:51
 */
@Controller
@RequestMapping(value = "/chapterManager")
public class ChapterManagerController {

    @Autowired
    private ChapterService chapterService;
    @Autowired
    private LogUtil logUtil;

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
    public Map<String,Object> updateChapter(HttpServletRequest request,Chapter chapter) throws Exception{
        Integer integer = chapterService.updateChapterByChapterId(chapter);
        String message = "";
        if (integer >0){
            message = "修改成功";
        }
        logUtil.setLog(request,"修改了章节名为"+chapter.getChapterName()+"的信息");
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
    public Map<String,Object> deleteChapter(HttpServletRequest request, Chapter chapter) throws Exception{
        Integer integer = chapterService.deleteByChapterId(chapter);
        String message = "";
        if (integer >0){
            message = "删除成功";
            logUtil.setLog(request,"删除了章节id为"+chapter.getChapterId()+"的信息");
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
