package com.zlk.zlkproject.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName LogoutController
 * @Description: 退出登陆Controller
 * @Author lufengxiang
 * Date 2019/11/21 9:49
 **/
@Controller
public class LogoutController {
    @RequestMapping(value = "/")
    public String logout(){
        return "admin/login";
    }
}
