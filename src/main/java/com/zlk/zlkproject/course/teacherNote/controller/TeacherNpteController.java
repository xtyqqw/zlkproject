package com.zlk.zlkproject.course.teacherNote.controller;

import com.zlk.zlkproject.course.teacherNote.service.TeacherNoteService;
import com.zlk.zlkproject.entity.TeacherNote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
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

    /**
     * 查询所有并分页
     * @param page
     * @param limit
     * @return
     */
    @RequestMapping("/selectTNAllByLimit")
    @ResponseBody
    public Map selectTNAllByLimit(int page, int limit){
        Map map = new HashMap();
        map.put("code",0);
        map.put("msg","");
        map.put("count",teacherNoteService.selectTNByCount());
        map.put("data",teacherNoteService.selectTNByLimit(page,limit));
        return map;
    }

    /**
     * 根据讲师笔记ID删除记录
     * @param tnId
     * @return
     */
    @RequestMapping("/deleteByTNId")
    @ResponseBody
    public Integer deleteByTNId(Integer tnId){
        return teacherNoteService.deleteByTNId(tnId);
    }

    /**
     * 添加数据
     * @param teacherNote
     * @return
     */
    @RequestMapping("/insertTNByTeacherNote")
    public String insertTNByTeacherNote(TeacherNote teacherNote){
        teacherNote.setDate(new Date());
        int i = teacherNoteService.insertTNByTeacherNote(teacherNote);
        if (i>0){
            return "/view/toTeacherNoteManager";
        }
        return "添加失败";
    }

    /**
     * 根据讲师笔记对象修改数据
     * @param teacherNote
     * @return
     */
    @RequestMapping("/updateTNByTeacherNote")
    public String updateTNByTeacherNote(TeacherNote teacherNote){
        int i = teacherNoteService.updateTNByTeacherNote(teacherNote);
        if (i>0){
            return "/view/toTeacherNoteManager";
        }
        return "修改失败";
    }
}
