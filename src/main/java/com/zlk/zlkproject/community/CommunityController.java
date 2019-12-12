package com.zlk.zlkproject.community;

import com.zlk.zlkproject.community.articleHot.service.ArticleHotService;
import com.zlk.zlkproject.community.articleTag.service.TagsService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @program: controller
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/10 9:22
 */

@Controller
public class CommunityController {

    @Autowired
    private ArticleHotService articleHotService;

    @Autowired
    private TagsService tagsService;

    /**
     * @description: 跳转社区页
     * @param article
     * @param tag
     * @return: org.springframework.web.servlet.ModelAndView
     * @author: QianKeQin
     * @date: 2019/12/10 9:26
     */
    @RequestMapping("/CommunityPage")
    public ModelAndView selectTitleByArticle(Article article, Tag tag) {
        //根据当月创建时间和浏览量降序查询最新文章集合 月排序
        List<Article> alist = articleHotService.selectTitleByArticle(article);
        //根据浏览量倒序返回文章集合 总排序
        List<Article> blist = articleHotService.findTitleByBrowseCount(article);
        ModelAndView mv=new ModelAndView();
        mv.addObject("alist",alist);
        mv.addObject("blist",blist);
        //查询所有标签
        List<Tag> tagList=tagsService.getAllTagByTagId(tag);
        mv.addObject("tagList",tagList);
        mv.setViewName("view/community/newCommunityMain");
        return mv;
    }
}
