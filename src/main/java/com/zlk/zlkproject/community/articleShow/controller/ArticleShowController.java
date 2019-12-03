package com.zlk.zlkproject.community.articleShow.controller;

import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

    @GetMapping(value = "/community/article-show/{id}")
    public ModelAndView articleShow(Long id) {
        ModelAndView mv=new ModelAndView();
        mv.addObject("article", articleShowService.getAndConvert(id));
        mv.setViewName("view/community/articleShow");
        return mv;
    }
}
