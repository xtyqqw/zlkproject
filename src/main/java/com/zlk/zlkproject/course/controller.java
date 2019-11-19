package com.zlk.zlkproject.course;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: zlkproject
 * @description: 控制类
 * @author: zyx
 * @create: 2019-11-18 14:44
 */
@Controller
public class controller {

    @RequestMapping(value = "/toVideo")
    public String toVideo() throws Exception{
        return "/view/videoPlayer";
    }
}
