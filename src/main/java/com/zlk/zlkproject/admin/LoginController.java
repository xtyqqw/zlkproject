package com.zlk.zlkproject.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName LoginController
 * @Description: 管理员登陆Controller
 * @Author lufengxiang
 * Date 2019/11/18 11:02
 **/
@Controller
@RequestMapping(value = "/loginController")
public class LoginController {

    @RequestMapping(value = "/toSuccess")
    public String toLogin(){
        return "admin/success";
    }

    @RequestMapping(value = "/toMain")
    public String toMain(){
        return "admin/main";
    }

}
