package com.zlk.zlkproject.community.articleTag.controller;

import com.zlk.zlkproject.community.articleTag.service.ArticlesTagsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

/**
 * @program: ArticlesTagsController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/10 20:55
 */

@Controller
public class ArticlesTagsController {

    @Autowired
    private ArticlesTagsService articlesTagsService;

    @GetMapping(value = "/community/tags")
    public ModelAndView tags(@PageableDefault(size = 5, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                             @PathVariable Integer tagId){
        ModelAndView mv = new ModelAndView();
        mv.addObject("page", articlesTagsService.listArticles(tagId, pageable));
        mv.addObject("activeTagId",tagId);
        mv.setViewName("view/community/articlesTags");
        return mv;
    }
}
