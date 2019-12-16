package com.zlk.zlkproject.user.aboutus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView toIframe(String typeNum){
        ModelAndView mv = new ModelAndView();
        mv.setViewName("view/aboutus/aboutus");
        mv.addObject("typeNum",typeNum);
        return mv;
    }

    /**
     * 跳转关于我们功能
     * @return
     */
    @RequestMapping("/aboutzlk")
    public String aboutzlk(){
        return "view/aboutus/aboutzlk";
    }

    /**
     * 跳转友情链接功能
     * @return
     */
    @RequestMapping("/blogroll")
    public String blogroll(){
        return "view/aboutus/blogroll";
    }
    /**
     * 跳转团队介绍页面
     * @return
     */
    @RequestMapping("/teamIntroduce")
    public String teamIntroduce(){
        return "view/cxr/teamIntroduce";
    }
}
