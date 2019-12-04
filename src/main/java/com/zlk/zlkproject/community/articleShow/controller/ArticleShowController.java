package com.zlk.zlkproject.community.articleShow.controller;

import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.community.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

/**
 * @program: ArticleShowController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 13:09
 */

@Controller
public class ArticleShowController {
    @Autowired
    private ArticleShowService articleShowService;
    @GetMapping(value = "/community/article-show")
    public ModelAndView articleShow(String id) {
        ModelAndView mv=new ModelAndView();
        id="1829739930";
        mv.addObject("article", articleShowService.getAndConvert(id));
        mv.setViewName("view/community/articleShow");
        return mv;
    }
}
