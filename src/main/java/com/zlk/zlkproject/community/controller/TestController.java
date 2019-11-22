package com.zlk.zlkproject.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/test")
public class TestController {
    @RequestMapping(value = "/community")
    public String toTest(){
        return "hotArticle";
    }

}
