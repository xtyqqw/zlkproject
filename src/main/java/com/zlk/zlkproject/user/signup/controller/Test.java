package com.zlk.zlkproject.user.signup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: Test
 * @description: 占位用文件
 * @author: xty
 * @create: 2019/11/18 10:22
 **/
@Controller
@RequestMapping(value = "/test")
public class Test {
    @RequestMapping(value = "/tooo")
    public String tooo(){
        return "/view/aboutus/aboutzlk";
    }

    @RequestMapping(value = "/too")
    public String too(){
        return "/view/aboutus/cooperative";
    }

    @RequestMapping(value = "/friend")
    public String fri(){
        return "view/aboutus/friendly";
    }
}
