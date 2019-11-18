package com.zlk.zlkproject.course.kecheng;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/18 16:41
 */
@Controller
public class Test {
    @RequestMapping("/kecheng/keChengJeiShao")
    public String keChengJeiShao(){
        return "view/kechengjeishao";
    }
}
