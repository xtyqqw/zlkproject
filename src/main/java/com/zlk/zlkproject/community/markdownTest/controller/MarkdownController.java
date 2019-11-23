package com.zlk.zlkproject.community.markdownTest.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * @program: MarkdownController
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 12:48
 */
@Controller
public class MarkdownController {

    @RequestMapping("/markdown")
    public String test(){

        return "view/markdownTest";
    }

    @RequestMapping("/markdownTest")
    public String markdownTest(Model model, @RequestParam("markdownContent") String markdownContent ){
        model.addAttribute("markdownContent", markdownContent);
        return "view/markdownText";
    }
}
