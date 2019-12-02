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
    /**
     * @Author lufengxiang
     * @Description //TODO 退出登录
     * @Date 10:59 2019/11/22
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/")
    public String logout(){
        return "admin/login";
    }
}
