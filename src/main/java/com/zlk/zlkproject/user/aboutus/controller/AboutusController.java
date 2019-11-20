package com.zlk.zlkproject.user.aboutus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName： AboutusController
 * @Description： 关于我们各功能跳转
 * @Author： wy
 * @Date： 2019/11/19 17:21
 */
@Controller
@RequestMapping("/aboutus")
public class AboutusController {
    /**
     * 测试关于我们页面跳转
     * @return
     */
    @RequestMapping("/aboutus")
    public String aboutus(){
        return "view/aboutus/aboutus";
    }

    /**
     * 跳转关于我们功能
     * @return
     */
    @RequestMapping("/aboutzlk")
    public String aboutzlk(){
        return "view/aboutus/aboutzlk";
    }
}
