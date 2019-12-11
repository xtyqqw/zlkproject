package com.zlk.zlkproject.community.articleList.controller;

import com.zlk.zlkproject.community.articleHot.service.ArticleHotService;
import com.zlk.zlkproject.community.articleList.service.ArticleListService;
import com.zlk.zlkproject.community.articleTag.service.TagsService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * @program:AarticleListController
 * @description:
 * @author:zj
 * @date:2019/11/19 10:29
 */
@Controller
@RequestMapping(value = "/articles")
public class ArticleListController {
    @Autowired
    private ArticleListService articleListService;
    /**
     * 登录接口
     * @return
     */
    /*@RequestMapping(value = "/toLogin")
    public String toLogin(){
        return "view/community/newCommunityMain";
    }*/
    /**
     * 我要发文接口
     * @return
     */
    @RequestMapping(value = "/toArticleEdit")
    public ModelAndView toArticleEdit(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("view/community/articleGuide");
        return mv;
    }
    /**
     * 测试页面
     * @return
     */
    @RequestMapping(value = "/toTest")
    public String toTest(){
        return "view/community/test";
    }

    @RequestMapping(value = "/findByCreateTime")
    @ResponseBody
    public Map<String,Object> findByCreateTime(Pagination pagination)throws Exception{
        List<Article> articleList=articleListService.findByCreateTime(pagination);
        Map<String,Object> map=new HashMap<>();
        map.put("articleList",articleList);
        return map;
    }

    @RequestMapping(value = "/findByBrowseCount")
    @ResponseBody
    public Map<String,Object> findByBrowseCount(Pagination pagination)throws Exception{
        List<Article> articleList = articleListService.findByBrowseCount(pagination);
        Map<String,Object> map =new HashMap<>();
        map.put("articleList",articleList);
        return map;
    }
    /*@RequestMapping(value = "/findByUserId")
    public ModelAndView findByUserId(String userId,HttpServletRequest request)throws Exception{
        ModelAndView mv=new ModelAndView();
        userId = (String) request.getSession().getAttribute("userId");
        List<Article> articleList=articleListService.findByUserId(userId);
        if (userId == null) {
            mv.addObject("msg", "请先进行登录");
            mv.setViewName("");
            return mv;
        }
        mv.addObject("articleList",articleList);
        mv.setViewName("view/community/articleMy");
        return mv;
    }*/
    @RequestMapping(value = "/findByUserId")
    @ResponseBody
    public Map<String,Object> findByUserId(String userId,Pagination pagination)throws Exception{
        User user=new User();
        user.setUserId("adfd95a4b3634b58b0cf3b8c67b18a29");
        pagination.setUserId("adfd95a4b3634b58b0cf3b8c67b18a29");
        List<Article> articleList=articleListService.findByUserId(pagination);
        Map<String,Object> map=new HashMap<>();
        map.put("articleList",articleList);
        return map;
    }

    @Autowired
    private ArticleHotService articleHotService;

    @Autowired
    private TagsService tagsService;
    /**
     * 根据条件倒序查询文章标题
     * 用ModelAndView查询数据库数据返回到jsp页面对应位置显示
     * @param article
     * @returnModelAndView
     */
    @RequestMapping("/toLogin")
    public ModelAndView selectTitleByArticle(Article article, Tag tag) {
        /**根据时间倒序返回文章标题集合 月排序*/
        List<Article> alist = articleHotService.selectTitleByArticle(article);
        /**根据浏览量倒序返回文章标题集合 总排序*/
        List<Article> blist = articleHotService.findTitleByBrowseCount(article);
        ModelAndView mv=new ModelAndView();

        mv.addObject("alist",alist);
        mv.addObject("blist",blist);
        List<Tag> tagList=tagsService.getAllTagByTagId(tag);
        mv.addObject("tagList",tagList);
        mv.setViewName("view/community/newCommunityMain");

        return mv;
    }
}