package com.zlk.zlkproject.course.chapter.controller;

import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping(value = "/findChapters")
    @ResponseBody
    public Map<String,Object> findChapters(Integer coursesId)throws Exception{
        coursesId = 1;
        List<Chapter> chapters = chapterService.findChapterByCoursesId(coursesId);
        for (Chapter chapter : chapters) {
            System.out.println(chapter.getSectionList());
        }
        Map<String,Object> map = new HashMap<>();
        map.put("chapters",chapters);
        return map;
    }
}