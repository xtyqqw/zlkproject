package com.zlk.zlkproject.course.chapter.controller;

import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Section;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.time.temporal.ChronoUnit;
import java.util.*;

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
    public Map<String,Object> findChapters(HttpServletRequest request,Integer sectionId)throws Exception{
//        Integer coursesId = 3;
//        Integer coursesId = (Integer) request.getSession().getAttribute("coursesId");
        Integer coursesId = chapterService.selectCoursesIdBySectionId(sectionId);
        List<Chapter> chapters = chapterService.findChapterByCoursesId(coursesId);
        for (Chapter chapter : chapters) {
            Collections.sort(chapter.getSectionList(), new Comparator<Section>(){
                public int compare(Section s1,Section s2){
                    return s1.getSectionNum().compareTo(s2.getSectionNum());
                }
            });
        }
        Map<String,Object> map = new HashMap<>();
        map.put("msg","查找成功");
        map.put("chapters",chapters);
        return map;
    }


}
