package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.user.entity.Notes;
import com.zlk.zlkproject.user.personal.service.NotesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/notes")
public class NotesController {
    /*加载外部资源*/
    @Autowired
    private NotesService notesService;
    @RequestMapping(value = "toNotes")
    public String note(){
        return "sdd/tst";
    }
    /*查询个人笔记方法*/
    @RequestMapping(value = "select")
    @ResponseBody
    public Map<String,Object> list(Notes notes){
        List<Notes> lists=notesService.selectNotes(notes);
        Map<String,Object> map=new HashMap<>();
        /*查询所有信息*/
        map.put("code",0);
        map.put("data",lists);
        return map;
    }
    /*修改*/
    @RequestMapping(value = "/update")
    @ResponseBody
    public ModelAndView update(Notes notes){
        Integer notes1=notesService.updateNotes(notes);
        ModelAndView mv=new ModelAndView();
        if(notes1==1){
            notesService.selectNotes(notes);
            mv.setViewName("sdd/tst");
            return mv;
        }else{
            return null;
        }
    }
    /*删除*/
    @RequestMapping(value = "delete")
    public String delete(Integer snId){
        Integer flag=notesService.deleteNotes(snId);
        if(flag==1){
            return "删除成功";
        }else{
            return "删除失败";
        }
    }

}
