package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.user.entity.Item;
import com.zlk.zlkproject.user.entity.Users;
import com.zlk.zlkproject.user.personal.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName： RecordController
 * @Description： 查询学习记录
 * @Author： sd
 * @Date： 2019/11/26 11:09
 */
@Controller
@RequestMapping(value = "/courses")
public class RecordController {
    /**
     * 注入外部资源
     */
    @Autowired
    private RecordService recordService;

    /**
     * 跳转页面
     * @return
     */
    @RequestMapping(value = "/tocourses")
    public String to(){
        return "view/personal/learnrecord";
    }

    /**
     * 根据userId查询学习记录
     * @param userId
     * @return
     */
    /*@RequestMapping(value = "/coursess")
    public ModelAndView selectCourses(String userId){
        List<String> list=recordService.selectCourses("1");
        *//*List<Item> itemList=service.ser("1");*//*
        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.setViewName("view/personal/learnrecord");
        return mv;
    }*/
    @RequestMapping(value = "icourses")
    public ModelAndView selectItem(String userId){
        List<Item> itemList=recordService.selectCourses("1");
        ModelAndView mv=new ModelAndView();
        mv.addObject("itemList",itemList);
        mv.setViewName("view/personal/learnrecord");
        return mv;
    }
}
