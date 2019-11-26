package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.user.personal.service.ArticlesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName： ArticlesController
 * @Description： 后台文章Controller
 * @Author： sd
 * @Date： 2019/11/23 10:11
 */
@Controller
@RequestMapping(value = "/articles")
public class ArticlesController {
    /*注入外部资源*/
    @Autowired
    private ArticlesService articlesService;

    /**
     * 根据userid查询user文章的集合
     * @param userId
     * @return
     */
    @RequestMapping(value = "toarticles")
    @ResponseBody
    public Map<String,Object> selectArticles(String userId){
        /*userId="1";*/
        List<Article> list=articlesService.selectArticles("1");
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("data",list);
        return map;
    }

}
