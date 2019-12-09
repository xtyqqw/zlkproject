package com.zlk.zlkproject.community.articleTag.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zlk.zlkproject.community.articleTag.service.ArticleByTagService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: ArticleByTagController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/9 15:10
 */

@Controller
public class ArticleByTagController {

    @Autowired
    private ArticleByTagService articleByTagService;

    @RequestMapping(value = "/getArticleByTag")
    @ResponseBody
    public Map<String, Object> findArtTag(Integer tagId, Pagination pagination) throws Exception{
        List<Article> articleList=articleByTagService.findArticleByTag(tagId,pagination);
        Map<String, Object> map = new HashMap<>();
        map.put("articleList",articleList);
        return map;
    }

    @RequestMapping(value = "/toArticleByTag")
    public ModelAndView toArtTag() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("view/community/articleByTag");
        return mv;
    }
}
