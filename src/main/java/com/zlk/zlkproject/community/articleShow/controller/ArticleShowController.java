package com.zlk.zlkproject.community.articleShow.controller;

import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.entity.Article;
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

    @GetMapping(value = "/community/article-show")
    public ModelAndView articleShow(String id) {
        ModelAndView mv=new ModelAndView();
        id="439621923";
        mv.addObject("article", articleShowService.getAndConvert(id));
        mv.setViewName("view/community/articleShow");
        return mv;
    }

    //跳转文章详情页测试用方法，使用时解开注释
    /*@GetMapping(value = "/community/article-show/{articleId}")
    public ModelAndView articleShowTest(String id) {
        ModelAndView mv=new ModelAndView();
        mv.addObject("article", articleShowService.getAndConvert(id));
        mv.setViewName("view/community/articleShow");
        return mv;
    }*/
}
