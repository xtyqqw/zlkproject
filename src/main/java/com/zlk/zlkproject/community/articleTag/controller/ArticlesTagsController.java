package com.zlk.zlkproject.community.articleTag.controller;

import com.zlk.zlkproject.community.articleTag.service.ArticlesTagsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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

    //点标签查询文章的请求方法
    @GetMapping(value = "/community/tags")
    public ModelAndView tags(@PageableDefault(page = 0, value = 4, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                             Integer tagId){
        ModelAndView mv = new ModelAndView();
        if (tagId != null) {
            mv.addObject("pages", articlesTagsService.listArticles(tagId, pageable));
            mv.addObject("activeTagId",tagId);
            mv.setViewName("view/community/articlesTags");
            return mv;
        } else {
            mv.setViewName("view/community/articleNo");
            return mv;
        }
    }
}
