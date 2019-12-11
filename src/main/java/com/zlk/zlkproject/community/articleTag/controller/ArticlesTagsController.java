package com.zlk.zlkproject.community.articleTag.controller;

import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.community.articleTag.service.ArticlesTagsService;
import com.zlk.zlkproject.community.articleTag.service.TagsService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
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

    @Autowired
    private TagsService tagsService;

    @GetMapping(value = "/community/tags")
    public ModelAndView tags(@PageableDefault(size = 5, sort = {"updateTime"}, direction = Sort.Direction.DESC) Pageable pageable,
                             Integer tagId, Article article, Tag tag){
        ModelAndView mv = new ModelAndView();
        mv.addObject("pages", articlesTagsService.listArticles(tagId, pageable));
        mv.addObject("articles", articlesTagsService.findArticleAll(article));
        //mv.addObject("tags",tagsService.getAllTagByTagId(tag));
        mv.addObject("activeTagId",tagId);
        mv.setViewName("view/community/articlesTags");
        return mv;
    }
}
