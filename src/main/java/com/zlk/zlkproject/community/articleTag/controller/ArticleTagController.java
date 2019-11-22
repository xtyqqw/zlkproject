package com.zlk.zlkproject.community.articleTag.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: ArticleTagController
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 15:18
 */
@Controller
public class ArticleTagController {

    @RequestMapping(value = "/at")
    public String at(){
        return "view/articleTag";
    }
}
