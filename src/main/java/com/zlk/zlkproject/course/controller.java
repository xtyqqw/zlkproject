package com.zlk.zlkproject.course;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
<<<<<<< HEAD
 * @program: zlkproject
 * @description: 控制类
 * @author: zyx
 * @create: 2019-11-18 14:44
 */
@Controller
public class controller {

    @RequestMapping(value = "/toVideo")
    public String toVideo() throws Exception{
        return "/view/videoPlayer";
    }

    @RequestMapping(value = "/HomePage")
    public String toLogin() throws Exception {//跳转登录页页面的方法
        return "view/courseHomePage";
    }
}
