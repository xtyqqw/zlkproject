package com.zlk.zlkproject.community.articleTag.controller;

import com.zlk.zlkproject.community.articleTag.service.ArticleTagService;
import com.zlk.zlkproject.community.articleTag.service.TagService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @program: ArticleTagController
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 15:18
 */
@Controller
public class ArticleTagController {

    @Autowired
    private TagService tagService;
    @Autowired
    private ArticleTagService articleTagService;

    /*@RequestMapping(value = "/at")
    public String at(){
        return "view/articleTag";
    }*/

    @RequestMapping(value = "/community/tag")
    public ModelAndView getAllTag(HttpServletRequest request, Integer tagId){
        ModelAndView mv=new ModelAndView();
        Tag tag= (Tag) tagService.getAllTagByTagId(tagId);
        mv.addObject("tagName",tag.getTagName());
        mv.setViewName("view/articleTag");
        return mv;
    }
}
