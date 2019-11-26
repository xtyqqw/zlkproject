package com.zlk.zlkproject.community.articleList.controller;

import com.zlk.zlkproject.community.articleList.service.ArticleListService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    /*@RequestMapping(value = "/findByCreateTime")
    public String findByCreateTime(Model model){
        List<Article> articleList=articleListService.findByCreateTime();
        model.addAttribute("articleList",articleList);
        return "view/community/articleAll";
    }*/
    @RequestMapping(value = "/findByCreateTime")
    public ModelAndView findByCreateTime()throws Exception{
        ModelAndView mv=new ModelAndView();
        List<Article> articleList=articleListService.findByCreateTime();
        //Map<String,Object> map=new HashMap<>();
        mv.addObject("articleList",articleList);
        mv.setViewName("view/community/articleAll");
        return mv;
    }
    @RequestMapping(value = "/findByBrowseCount")
    public String findByBrowseCount(Model model){
        List<Article> articleList=articleListService.findByBrowseCount();
        model.addAttribute("articleList",articleList);
        return "view/community/articleHot";
    }
    @RequestMapping(value = "/findByUserId")
    public String findByUserId(Model model,String userId){
        List<Article> articleList=articleListService.findByUserId(userId);
        model.addAttribute("articleList",articleList);
        return "view/community/articleMy";
    }

}
