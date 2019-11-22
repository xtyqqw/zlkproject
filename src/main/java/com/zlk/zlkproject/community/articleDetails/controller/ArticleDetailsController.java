package com.zlk.zlkproject.community.articleDetails.controller;

import com.zlk.zlkproject.community.articleDetails.service.ArticleDetailsService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
     * 根据创建时间降序查询最新文章标题
     * 用ModelAndView查询数据库数据返回到jsp页面对应位置显示
     * @param article
     * @return
     */
    @RequestMapping("/selectTitleByArticle")
    @ResponseBody
    public ModelAndView selectTitleByArticle(Article article) {
        List<Article> alist = articleDetailsService.selectTitleByArticle(article);
        System.out.println(alist);
        /*根据浏览量倒序返回文章标题集合 总排序*/
        List<Article> blist = articleDetailsService.findTitleByBrowseCount(article);
        System.out.println(blist);
        ModelAndView mv=new ModelAndView();

        mv.addObject("alist",alist);
        mv.addObject("blist",blist);
        mv.setViewName("article");

        return mv;
    }

    /*@RequestMapping(value = "/toArticleDetails")
    public ModelAndView toArticleDetails(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        String articleId = (String)request.getSession().getAttribute("articleId");
        Article article = articleDetailsService.selectById(articleId);
        mv.addObject("title",article.getTitle());//文章标题
        mv.addObject("browseCount",article.getBrowseCount());//浏览数量
        mv.addObject("commentCount",article.getCommentCount());//评论数量
        mv.addObject("createTime",article.getCreateTime());//发布时间
        mv.addObject("articleDigest",article.getArticleDigest());//文章摘要
        mv.addObject("articleContent",article.getArticleContent());//文章详情
        mv.addObject("userImg",article.getUserImg());//用户头像相对路径
        mv.addObject("userName",article.getUserName());//用户名
        mv.addObject("zanCount",article.getZanCount());//赞数量
        mv.addObject("caiCount",article.getCaiCount());//踩数量
        mv.setViewName("hotArticle");

        return mv;
    }*/


}
