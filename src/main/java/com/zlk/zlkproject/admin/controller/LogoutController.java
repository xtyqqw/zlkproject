package com.zlk.zlkproject.admin.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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
    @RequestMapping(value = "/logout")
    public String logout(){
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "admin/login";
    }
}
