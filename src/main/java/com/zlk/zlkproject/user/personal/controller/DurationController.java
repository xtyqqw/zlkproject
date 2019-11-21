package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.service.DurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/duration")
public class DurationController {
    /*加载外部资源*/
    @Autowired
    private DurationService durationService;

    @RequestMapping(value = "/select")
    @ResponseBody
    /*用视图和模型的方法查询最新的一条数据*/
    public ModelAndView list(User user){
        User lists=durationService.selectDuration(user);
        ModelAndView mv=new ModelAndView();
        /*添加一个对象*/
        mv.addObject("lists",lists);
        /*添加一个地址*/
        mv.setViewName("view/personal/learnlook");
        return mv;
    }
    /*@RequestMapping(value = "user")
    public ModelAndView one(User user)throws Exception{
        List<User> slist=durationService.selectDuration(user);
        User user1=slist.get(17);
        Integer a=2;
        Integer user2=user1.getUserAllTime();
        a=user2*a;
        ModelAndView mv=new ModelAndView();
        mv.addObject("a",a);
        mv.setViewName("ttt");
        return mv;
    }*/
}
