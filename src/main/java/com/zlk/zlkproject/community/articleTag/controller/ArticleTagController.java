package com.zlk.zlkproject.community.articleTag.controller;

import com.zlk.zlkproject.community.articleTag.service.ArticleTagService;
import com.zlk.zlkproject.community.articleTag.service.TagsService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @program: ArticleTagController
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 15:18
 */
@Controller
public class ArticleTagController {

    @Autowired
    private TagsService tagsService;
    @Autowired
    private ArticleTagService articleTagService;

    /*@RequestMapping(value = "/at")
    public String at(){
        return "view/articleTag";
    }*/

    @RequestMapping(value = "/community/tag")
    public ModelAndView getAllTag(HttpServletRequest request, Tag tag){
        ModelAndView mv=new ModelAndView();
        List<Tag> tagList=tagsService.getAllTagByTagId(tag);
        mv.addObject("tagList",tagList);
        System.out.println("tagList="+tagList);
        mv.setViewName("view/articleTag");
        return mv;
    }


}
