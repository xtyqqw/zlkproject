package com.zlk.zlkproject.user.personal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName： PersonalController
 * @Description： 个人中心各功能跳转
 * @Author： wy
 * @Date： 2019/11/19 16:43
 */
@Controller
@RequestMapping("/personal")
public class PersonalController {
    /**
     * 测试个人中心
     * @return
     */
    @RequestMapping("/person")
    public String jsp(){
        return "view/personal/personal";
    }
    /**
     * 学习记录
     * @return
     */
    @RequestMapping("/learnrecord")
    public String learnlook(){
        return "view/personal/learnrecord";
    }
    /**
     * 我的关注
     * @return
     */
    @RequestMapping("/myfocus")
    public String myfocus(){
        return "view/personal/myfocus";
    }

    /**
     * 关注他的人
     * @return
     */
    @RequestMapping("/followhim")
    public String followhim(){
        return "view/personal/followhim";
    }

    /**
     * 他关注的人
     * @return
     */
    @RequestMapping("/hefollows")
    public String hefollows(){
        return "view/personal/hefollows";
    }
}
