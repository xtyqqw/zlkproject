package com.zlk.zlkproject.user.aboutus.controller;

import com.zlk.zlkproject.user.aboutus.service.LecturerService;
import com.zlk.zlkproject.user.entity.Lecturer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/lecturer")
public class LecturerController {
    @Autowired
    private LecturerService lecturerService;
    /*@RequestMapping(value = "tolecturer")
    public String lec(){
        return "view/aboutus/teamwork";
    }*/
    /*查询合作讲师*/
    @RequestMapping(value = "lecturers")
    @ResponseBody
    public ModelAndView select(){
        List<Lecturer> list=lecturerService.selectLecturer();
        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.setViewName("view/aboutus/teamwork");
        return mv;
    }
}
