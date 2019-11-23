package com.zlk.zlkproject.course.section.controller;

import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Section;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView findSections()throws Exception{
        int coursesId = 1;
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

    @RequestMapping(value = "/findState")
    @ResponseBody
    public Map<String, Object> findState(Integer sectionId) throws Exception{
        Integer userId = 1;
        String state = sectionService.findStateById(userId,sectionId);
        if (state ==null){
            state = "未开始";
        }
        Map<String,Object> map = new HashMap<>();
        map.put("state",state);
        return map;
    }

    @RequestMapping(value = "/findVideoAddr")
    @ResponseBody
    public Map<String,Object> findVideoAddr(Integer sectionId) throws Exception{
        String videoAddr = sectionService.findVideoAddrById(sectionId);
        Map<String,Object> map = new HashMap<>();
        map.put("videoAddr",videoAddr);
        return map;
    }
}
