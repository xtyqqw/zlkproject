package com.zlk.zlkproject.community.articleList.controller;

import com.zlk.zlkproject.community.articleList.service.ArticleListService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @program:AarticleListController
 * @description:
 * @author:zj
 * @date:2019/11/19 10:29
 */
@Controller
@RequestMapping(value = "/article")
public class ArticleListController {
    @Autowired
    private ArticleListService articleListService;

    @RequestMapping(value = "/findByCreateTime")
    public ModelAndView findByCreateTime()throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Article> articleList=articleListService.findByCreateTime();
        mv.addObject("articleList",articleList);
        mv.setViewName("view/community/articleAll");
        return mv;
    }
    @RequestMapping(value = "/findByBrowseCount")
    public ModelAndView findByBrowseCount()throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Article> articleList=articleListService.findByBrowseCount();
        mv.addObject("articleList",articleList);
        mv.setViewName("view/community/articleHot");
        return mv;
    }
    /*@RequestMapping(value = "/findByUserId")
    public ModelAndView findByUserId(String userId,HttpServletRequest request)throws Exception{
        ModelAndView mv=new ModelAndView();
        userId = (String) request.getSession().getAttribute("userId");
        List<Article> articleList=articleListService.findByUserId(userId);
        if (userId == null) {
            mv.addObject("msg", "请先进行登录");
            mv.setViewName("");
            return mv;
        }
        mv.addObject("articleList",articleList);
        mv.setViewName("view/community/articleMy");
        return mv;
    }*/
    @RequestMapping(value = "/findByUserId")
    public ModelAndView findByUserId(String userId)throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Article> articleList=articleListService.findByUserId("adfd95a4b3634b58b0cf3b8c67b18a27");
        mv.addObject("articleList",articleList);
        mv.setViewName("view/community/articleMy");
        return mv;
    }
}
