package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.Articles;
import com.zlk.zlkproject.user.personal.service.ArticlesService;
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
 * @ClassName： ArticlesController
 * @Description： 后台文章Controller
 * @Author： sd
 * @Date： 2019/11/23 10:11
 */
@Controller
@RequestMapping(value = "/articles")
public class ArticlesController {
    @Autowired(required = false)
    private ArticlesService articlesService;

    /**
     * 根据userid查询user文章的集合
     * @param
     * @return
     */
    @RequestMapping(value = "/toarticles")
    public ModelAndView selectArticles(HttpServletRequest request)throws Exception{
        User user = (User) request.getSession().getAttribute("user");
        Integer articles=articlesService.findArticlesId(user.getUserId());
        ModelAndView mv=new ModelAndView();
        mv.addObject("articles",articles);
        mv.setViewName("view/personal/myArticle");
        return mv;
    }
    /**
     * 点击跳转展示markdown
     * @param articles
     * @return
     * @throws Exception
     */
    @RequestMapping("/toArt")
    public ModelAndView toArt(Articles articles)throws Exception{
        ModelAndView mv=new ModelAndView();
        Articles articles1 = articlesService.findArtById(articles.getArticleId());
        mv.addObject("articles",articles1);
        mv.setViewName("view/personal/myArt");
        return mv;
    }
    /**
     * 修改
     * @param articles
     * @return
     */
    @RequestMapping(value = "update")
    public ModelAndView updateArticles(Articles articles)throws Exception{
        ModelAndView mv = new ModelAndView();
        Integer flag=articlesService.updateArticles(articles);
        mv.setViewName("redirect:/articles/toarticles");
        if(flag == 1){
            return mv;
        }else {
            return null;
        }
    }

    /**
     * 删除
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/datele")
    public String deleteArticles(String articleId)throws Exception{
        Integer flag=articlesService.deleteArticles(articleId);
        if(flag == 1){
            return "redirect:/articles/toarticles";
        }else {
            return null;
        }
    }
    /**
     * 流加载
     * */
    @RequestMapping(value = "/flow")
    @ResponseBody
    public Map<String,Object> findArticlesAll(HttpServletRequest request,Pagination pagination){
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        pagination.setUser(user);
        pagination.setUserId(userId);
        List<Articles> articlesList=articlesService.findArticlesAll(pagination);
        Integer all=articlesService.findArticlesId(userId);
        Map<String,Object> map=new HashMap<>();
        map.put("count",all);
        map.put("data",articlesList);
        return map;
    }

}
