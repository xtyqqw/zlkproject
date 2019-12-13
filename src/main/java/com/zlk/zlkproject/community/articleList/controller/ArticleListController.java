package com.zlk.zlkproject.community.articleList.controller;

import com.zlk.zlkproject.community.articleList.service.ArticleListService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
     * 最新文章接口
     * @return
     */
    @RequestMapping(value = "toArticleAll")
    public String toArticleAll(){
        return "view/community/articleAll";
    }

    /**
     * 最热文章接口
     * @return
     */
    @RequestMapping(value = "/toArticleHot")
    public String toArticleHot(){
        return "view/community/articleHot";
    }

    /**
     * 我的文章接口
     * @return
     */
    @RequestMapping(value = "/toArticleMy")
    public String toArticleMy(){
        return "view/community/articleMy";
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
        Integer count=articleListService.findArticleCount(pagination);
        Map<String,Object> map=new HashMap<>();
        map.put("articleList",articleList);
        map.put("count",count);
        return map;
    }

    @RequestMapping(value = "/findByBrowseCount")
    @ResponseBody
    public Map<String,Object> findByBrowseCount(Pagination pagination)throws Exception{
        List<Article> articleList = articleListService.findByBrowseCount(pagination);
        Integer count=articleListService.findArticleCount(pagination);
        Map<String,Object> map =new HashMap<>();
        map.put("articleList",articleList);
        map.put("count",count);
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
    public Map<String,Object> findByUserId(HttpServletRequest request,Pagination pagination)throws Exception{
        User user=new User();
        user.setUserId((String) request.getSession().getAttribute("userId"));
        pagination.setUserId((String) request.getSession().getAttribute("userId"));
        List<Article> articleList=articleListService.findByUserId(pagination);
        Integer count=articleListService.findArticleCount(pagination);
        Map<String,Object> map=new HashMap<>();
        if (user.getUserId() == null) {
            map.put("msg","请先进行登录");
            return map;
        }
        map.put("articleList",articleList);
        map.put("count",count);
        return map;
    }
}