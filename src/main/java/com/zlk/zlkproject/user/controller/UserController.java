package com.zlk.zlkproject.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: UserController
 * @description:
 * @author: xty
 * @create: 2019/11/18 9:42
 **/
@Controller
public class UserController {
    @RequestMapping(value = "/test")
    public String test(){
        return "test";
    }
}
