package com.zlk.zlkproject.community.articleAdd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: ArticleAddController
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/25 10:03
 */

@Controller
public class ArticleAddController {

    @RequestMapping(value = "/community/article-guide")
    public String articleGuide(){
        return "view/community/articleGuide";
    }

    @RequestMapping(value = "/community/article-no")
    public String articleNo(){
        return "view/community/articleNo";
    }

    @RequestMapping(value = "/community/article-add")
    public String articleAdd(){
        return "view/community/";
    }
}
