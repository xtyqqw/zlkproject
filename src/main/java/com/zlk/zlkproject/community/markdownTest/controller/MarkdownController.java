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

    /**
     * @description: markdown测试页面接口
     * @return: java.lang.String
     * @author: QianKeQin
     * @date: 2019/11/23 11:18
     */
    @RequestMapping("/markdown")
    public String test(){
        return "view/community/markdownTest";
    }

    /**
     * @description: markdown测试 提供表单提交按钮接口 保存请求数据并跳转markdown文本页面
     * @param model
     * @param markdownContent
     * @return: java.lang.String
     * @author: QianKeQin
     * @date: 2019/11/23 11:17
     */
    @RequestMapping("/markdownTest")
    public String markdownTest(Model model, @RequestParam("markdownContent") String markdownContent ){
        model.addAttribute("markdownContent", markdownContent);
        return "view/community/markdownText";
    }
}
