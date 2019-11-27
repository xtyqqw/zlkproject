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

    /**
     * @description: 提供社区页面展示标签接口
     * @param request
     * @param tag
     * @return: org.springframework.web.servlet.ModelAndView
     * @author: QianKeQin
     * @date: 2019/11/23 11:42
     */
    @RequestMapping(value = "/community/tag")
    public ModelAndView getAllTag(HttpServletRequest request, Tag tag){
        ModelAndView mv=new ModelAndView();
        List<Tag> tagList=tagsService.getAllTagByTagId(tag);
        mv.addObject("tagList",tagList);
        //System.out.println("tagList="+tagList);
        mv.setViewName("view/community/articleTag");
        return mv;
    }

}
