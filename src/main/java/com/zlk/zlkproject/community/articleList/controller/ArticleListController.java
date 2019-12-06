package com.zlk.zlkproject.community.articleList.controller;

import com.zlk.zlkproject.community.articleList.service.ArticleListService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
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
    @RequestMapping(value = "/toLogin")
    public String toLogin(){
        return "view/community/communityMain";
    }
    /**
     * 最新文章列表接口
     * @return
     */
    @RequestMapping(value = "/toArticleAll")
    public ModelAndView toArticleAll(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("view/community/articleAll");
        return mv;
    }
    /**
     * 热门文章列表接口
     * @return
     */
    @RequestMapping(value = "/toArticleHot")
    public ModelAndView toArticleHot(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("view/community/articleHot");
        return mv;
    }
    /**
     * 我的文章列表接口
     * @return
     */
    @RequestMapping(value = "/toArticleMy")
    public ModelAndView toArticleMy(){
        ModelAndView mv=new ModelAndView();
        mv.setViewName("view/community/articleMy");
        return mv;
    }
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
        List<Article> articleList=articleListService.findByUserId(userId,pagination);
        Map<String,Object> map=new HashMap<>();
        map.put("articleList",articleList);
        return map;
    }
}