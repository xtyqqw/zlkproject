package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.service.DurationService;
import com.zlk.zlkproject.user.until.Arith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 查询个人学习看板
 */
@Controller
@RequestMapping(value = "/duration")
public class DurationController {
    /*加载外部资源*/
    @Autowired
    private DurationService durationService;

    @RequestMapping(value = "/select")
    @ResponseBody
    /*用视图和模型的方法查询最新的一条数据*/
    public ModelAndView list(HttpServletRequest request, String userId){
        User user = (User) request.getSession().getAttribute("user");
        User lists=durationService.selectDuration(user.getUserId());
        ModelAndView mv=new ModelAndView();
        Integer addd= Arith.ride(lists.getUserDateTime());
        Integer ad = Arith.plus(lists.getUserDateTime());
        Integer all=durationService.findUser();
        Integer rank=durationService.findUserById(lists.getUserId());
        Integer rankall=Arith.divide(rank,all);
        mv.addObject("rankall",rankall);
        mv.addObject("ad",ad);
        mv.addObject("addd",addd);
        /*添加一个对象*/
        mv.addObject("lists",lists);
        /*添加一个地址*/
        mv.setViewName("view/personal/learnlook");
        return mv;
    }

}
