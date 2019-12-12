package com.zlk.zlkproject.community.articleHot.controller;

import com.zlk.zlkproject.community.articleHot.service.ArticleHotService;
import com.zlk.zlkproject.community.articleTag.service.TagsService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleHotController
 * @description:
 * @date 2019/11/19 20:29
 */
@Controller
@RequestMapping(value = "/articleHot")
public class ArticleHotController {
    @Autowired
    private ArticleHotService articleHotService;

    @Autowired
    private TagsService tagsService;
    /**
     * 根据条件倒序查询文章标题
     * 用ModelAndView查询数据库数据返回到jsp页面对应位置显示
     * @param article
     * @returnModelAndView
     */
    /*@RequestMapping("/toArticleHot")
    public ModelAndView selectTitleByArticle(Article article, Tag tag) {
        *//**根据时间和浏览量倒序返回文章标题集合 月排序*//*
        List<Article> alist = articleHotService.selectTitleByArticle(article);
        *//**根据浏览量倒序返回文章标题集合 总排序*//*
        List<Article> blist = articleHotService.findTitleByBrowseCount(article);
        ModelAndView mv=new ModelAndView();

        mv.addObject("alist",alist);
        mv.addObject("blist",blist);
        List<Tag> tagList=tagsService.getAllTagByTagId(tag);
        mv.addObject("tagList",tagList);
        mv.setViewName("view/community/newCommunityMain");

        return mv;
    }*/

}
