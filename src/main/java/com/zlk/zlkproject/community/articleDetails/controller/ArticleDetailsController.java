package com.zlk.zlkproject.community.articleDetails.controller;

import com.zlk.zlkproject.community.articleDetails.service.ArticleDetailsService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleDetailsController
 * @description:
 * @date 2019/11/19 20:29
 */
@Controller
@RequestMapping(value = "/articleDetails")
public class ArticleDetailsController {
    @Autowired
    private ArticleDetailsService articleDetailsService;

    /*@RequestMapping("/articleDetails")
    public String toArticleDetails() {
        return "article";
    }*/

    /**
     * 根据条件降序查询文章标题
     * 用ModelAndView查询数据库数据返回到jsp页面对应位置显示
     * @param article
     * @return
     */
    @RequestMapping("/toArticleDetails")
    @ResponseBody
    public ModelAndView selectTitleByArticle(Article article) {
        /*根据时间倒序返回文章标题集合 月排序*/
        List<Article> alist = articleDetailsService.selectTitleByArticle(article);
        //System.out.println(alist);
        /*根据浏览量倒序返回文章标题集合 总排序*/
        List<Article> blist = articleDetailsService.findTitleByBrowseCount(article);
        //System.out.println(blist);
        ModelAndView mv=new ModelAndView();

        mv.addObject("alist",alist);
        mv.addObject("blist",blist);
        mv.setViewName("view/community/article");

        return mv;
    }

}
