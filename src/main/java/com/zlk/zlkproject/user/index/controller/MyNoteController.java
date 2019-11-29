package com.zlk.zlkproject.user.index.controller;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.StuNote;
import com.zlk.zlkproject.user.index.service.MyNoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName： MyNoteController
 * @Description： 个人笔记控制类
 * @Author： yzh
 * @Date： 2019/11/28 10:51
 */
@Controller
@RequestMapping("/myNote")
public class MyNoteController {
    @Autowired
    private MyNoteService myNoteService;

    @RequestMapping("/toMyNote")
    public ModelAndView toMyNote()throws Exception{
        ModelAndView mv = new ModelAndView();
        String userId = "1";
        List<StuNote> stuNoteList = myNoteService.findNotesBySnId(userId);
        Integer noteNum = myNoteService.findNoteNumBySnId(userId);
        mv.addObject("stuNoteList",stuNoteList);
        mv.addObject("noteNum",noteNum);
        mv.setViewName("view/personal/myNote");
        return mv;
    }
    @RequestMapping("/delete")
    @ResponseBody
    public String deleteNote(Integer snId)throws Exception{
        Integer flag = myNoteService.deleteNoteBySnId(snId);
        if(flag == 1){
            return "删除成功";
        }else{
            return  "删除失败";
        }
    }

    @RequestMapping("/edit")
    public String editNote(StuNote stuNote)throws Exception{
        Integer flag = myNoteService.editNoteBySnId(stuNote);
        if(flag == 1){
            return "redirect:/myNote/toMyNote";
        }else{
            return null;
        }
    }
    @RequestMapping("/toFlow")
    @ResponseBody
    public Map<String, Object> findCoursesList(Pagination pagination) throws Exception {
        List<StuNote> stuNoteList = myNoteService.findNotesList(pagination);
        Map<String, Object> map = new HashMap<>();
        map.put("stuNoteList", stuNoteList);
        return map;
    }
}
