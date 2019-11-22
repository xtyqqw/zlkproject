package com.zlk.zlkproject.user.aboutus.controller;

import com.zlk.zlkproject.user.aboutus.service.RecruitService;
import com.zlk.zlkproject.user.entity.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
    @Autowired
    private RecruitService recruitService;
    @RequestMapping(value = "torecruit")
    public String add(){
        return "view/aboutus/teamwork";
    }
    @RequestMapping(value ="/recruits")
    public ModelAndView addrecruit(Recruit recruit){
        Integer flag=recruitService.addRecruit(recruit);
        ModelAndView mv=new ModelAndView();
        if(flag==1){
            mv.setViewName("view/aboutus/teamwork");
            return mv;
        }else{
            return null;
        }
    }

}
