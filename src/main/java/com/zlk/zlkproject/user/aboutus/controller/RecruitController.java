package com.zlk.zlkproject.user.aboutus.controller;

import com.zlk.zlkproject.user.aboutus.service.RecruitService;
import com.zlk.zlkproject.user.entity.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
/*
* 招聘信息
* */
@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
    /*加载外部资源*/
    @Autowired
    private RecruitService recruitService;
    /*跳转*/
    @RequestMapping(value = "torecruit")
    public String add(){
        return "view/aboutus/teamwork";
    }
    /*添加招聘信息*/
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
