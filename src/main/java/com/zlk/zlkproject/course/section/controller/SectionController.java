package com.zlk.zlkproject.course.section.controller;

import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Section;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 小节控制类
 * @author: zyx
 * @create: 2019-11-19 14:37
 */
@Controller
@RequestMapping(value = "/section")
public class SectionController {
    @Autowired
    private SectionService sectionService;
    @Autowired
    private ChapterService chapterService;

    @RequestMapping(value = "/findSections")
    @ResponseBody
    public ModelAndView findSections(HttpServletRequest request)throws Exception{
        Integer coursesId = (Integer) request.getSession().getAttribute("coursesId");
        List<Chapter> chapters = chapterService.findChapterByCoursesId(coursesId);
        List<Section> sections = new ArrayList<>();
        for (Chapter chapter : chapters) {
            sections = sectionService.findSectionByChapterId(chapter.getChapterId());
        }
        ModelAndView mv = new ModelAndView();
        mv.addObject("chapters",chapters);
        mv.addObject("sections",sections);
        mv.addObject("name","sss");
        mv.setViewName("/view/videoPlayer");
        return mv;
    }

    /**
     *  查找当前用户当前课程学习状态
     *@method findState
     *@params [sectionId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/11/23  11:32
     */
    @RequestMapping(value = "/findState")
    @ResponseBody
    public Map<String, Object> findState(HttpServletRequest request,Integer sectionId) throws Exception{
        //获取当前登录的用户id
        User user=(User)request.getSession().getAttribute("user");
        String userId = user.getUserId();
        String state = sectionService.findStateById(userId,sectionId);
        Map<String,Object> map = new HashMap<>();
        map.put("state",state);
        return map;
    }

    /**
     *  根据小节跳转视频
     *@method findVideoAddr
     *@params [sectionId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/11/23  11:33
     */
    @RequestMapping(value = "/findVideoAddr")
    @ResponseBody
    public Map<String,Object> findVideoAddr(HttpServletRequest request,Integer sectionId) throws Exception{
        Section section = sectionService.findVideoAddrById(sectionId);
        request.getSession().setAttribute("sectionId",sectionId);
        Map<String,Object> map = new HashMap<>();
        map.put("section",section);
        return map;
    }

    /**
     * 根据课程id分页查询课程下的所有小节
     * @param coureseId
     * @param page
     * @param limit
     * @return 带有课程信息的map
     */
    @RequestMapping(value ="/findSectionDetails")
    @ResponseBody

    public Map findSectionDetails(HttpServletRequest request,Integer coureseId,Integer page,Integer limit){
        //获取当前登录的用户id
        User user=(User)request.getSession().getAttribute("user");
        String userId;
        if(user!=null){
            userId = user.getUserId();
        }else {
            userId="";
        }

        coureseId = (Integer) request.getSession().getAttribute("coursesId");
        sectionService.findSectionByCourseIdLimit(userId,coureseId,page,limit);
        return sectionService.findSectionByCourseIdLimit(userId,coureseId,page,limit);
    }
}
