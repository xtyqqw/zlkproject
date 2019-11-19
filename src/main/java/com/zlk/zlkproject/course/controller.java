package com.zlk.zlkproject.course;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName controller
 * @Description:
 * @Author LuanKe
 * Date 2019/11/18 14:05
 **/
@Controller
@RequestMapping(value="/course") //用来指定模块
public class controller {
    //获取UserMapper 对象 @autowired注解的作用就是自动获取对象

        @RequestMapping(value = "/HomePage")
    public String toLogin() throws Exception {//跳转登录页页面的方法
        return "view/courseHomePage";
    }
}