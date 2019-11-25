package com.zlk.zlkproject.course.teacherNote.controller;

import com.zlk.zlkproject.course.teacherNote.service.TeacherNoteService;
import com.zlk.zlkproject.entity.TeacherNote;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.rsocket.context.LocalRSocketServerPort;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.jnlp.IntegrationService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 教师笔记控制类
 * @author: zyx
 * @create: 2019-11-22 10:57
 */
@Controller
@RequestMapping(value = "/teacherNote")
public class TeacherNpteController {

    @Autowired
    private TeacherNoteService teacherNoteService;

    /**
     *  查找当前小节教师笔记内容
     *@method findNotes
     *@params [sectionId, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/11/23  11:36
     */
    @RequestMapping(value = "/findNotes",method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findNotes(@RequestParam Integer sectionId,Integer page,Integer limit) throws Exception {
        List<TeacherNote> notes = teacherNoteService.findNotesBySectionId(sectionId, page, limit);
        Integer count = teacherNoteService.findCountBySectionId(sectionId);
        Integer pages;
        if (count%limit==0){
            pages = count/limit;
        }else {
            pages = count/limit +1;
        }
        Map<String, Object> map = new HashMap<>();
        map.put("notes",notes);
        map.put("pages",pages);
        return map;
    }
}
