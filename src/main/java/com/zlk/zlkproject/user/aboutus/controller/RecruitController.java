package com.zlk.zlkproject.user.aboutus.controller;

import com.zlk.zlkproject.user.aboutus.service.LecturerService;
import com.zlk.zlkproject.user.aboutus.service.RecruitService;
import com.zlk.zlkproject.user.entity.Lecturer;
import com.zlk.zlkproject.user.entity.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
* 招聘信息
* */
@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
    /*加载外部资源*/
    @Autowired
    private RecruitService recruitService;
    @Autowired
    private LecturerService lecturerService;
    /*跳转*/
    @RequestMapping(value = "torecruit")
    public String add(){
        return "view/aboutus/teamwork";
    }
    /*添加招聘信息*/
    @RequestMapping(value ="/recruits")
    @ResponseBody
    public Map<String,Object> addrecruit(Recruit recruit){
        Integer flag=recruitService.addRecruit(recruit);
        List<Lecturer> list=lecturerService.selectLecturer();
       /* ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);*/
        Map<String,Object> map=new HashMap<>();

        if(flag==1){
            /*map.put("list",list);*/
            map.put("msg","提交完成");
            /*mv.addObject("msg","提交成功");·
            mv.setViewName("view/aboutus/teamwork");*/
            return map;
        }else{
            /*mv.addObject("msg","提交失败");
            mv.setViewName("view/aboutus/teamwork");*/
            map.put("msg","提交失败");
            return map;
        }
    }

}
