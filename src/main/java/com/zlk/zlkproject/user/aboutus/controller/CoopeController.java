package com.zlk.zlkproject.user.aboutus.controller;

import com.zlk.zlkproject.user.aboutus.service.CooperativeService;
import com.zlk.zlkproject.user.entity.Cooperative;
import com.zlk.zlkproject.user.entity.Help;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @program: CoopeController
 * @description: 合作企业
 * @author: xty
 * @create: 2019/11/25 17:24
 **/
@Controller
@RequestMapping(value = "/coop")
public class CoopeController {
    @Autowired
    CooperativeService cooperativeService;

    /**
     * 查询合作企业的方法
     * 不需要传入参数
     * 当访问合作企业页面时直接访问该方法
     * */
    @RequestMapping(value = "/findall")
    public ModelAndView findAll(){
        ModelAndView mv = new ModelAndView();
        List<Cooperative> list = cooperativeService.findAll();
        mv.setViewName("/view/aboutus/cooperative");
        mv.addObject("list",list);
        return mv;
    }
    /**
     * 查询帮助中心信息的方法
     * 不需要传入参数
     * 当访问帮汉族中心时直接访问该方法
     * */
    @RequestMapping(value = "/help")
    public ModelAndView helpCenter(){
        ModelAndView mv = new ModelAndView();
        Help help = cooperativeService.findHelp();
        mv.setViewName("/view/aboutus/cooperative");
        mv.addObject("help",help);
        return mv;
    }
}
