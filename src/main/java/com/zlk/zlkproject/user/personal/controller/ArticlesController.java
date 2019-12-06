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
    /*注入外部资源*/
    @Autowired
    private ArticlesService articlesService;

    /**
     * 根据userid查询user文章的集合
     * @param userId
     * @return
     */
    @RequestMapping(value = "/toarticles")
    public ModelAndView selectArticles(HttpServletRequest request, String userId)throws Exception{
        User user = (User) request.getSession().getAttribute("user");
        List<Articles> list=articlesService.selectArticles(user.getUserId());
        Integer articles=articlesService.findArticlesId(user.getUserId());
        ModelAndView mv=new ModelAndView();
        mv.addObject("list",list);
        mv.addObject("articles",articles);
        mv.setViewName("view/personal/myArticle");
        return mv;
    }

    /**
     * 修改
     * @param articles
     * @return
     */
    @RequestMapping(value = "update")
    public String updateArticles(Articles articles)throws Exception{
        Integer flag=articlesService.updateArticles(articles);
        if(flag == 1){
            return "redirect:/articles/toarticles";
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
    /*流加载*/
    @RequestMapping(value = "/flow")
    @ResponseBody
    public Map<String,Object> findArticlesAll(Pagination pagination){
        List<Articles> articlesList=articlesService.findArticlesAll(pagination);
        Map<String,Object> map=new HashMap<>();
        map.put("articlesList",articlesList);
        return map;
    }

    /**
     * 插入标签
     *
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/updates")
    public ModelAndView updateTag(String articleId){
        ModelAndView mv=new ModelAndView();
        Integer article=articlesService.updateTag(articleId);
        mv.addObject("article",article);
        mv.setViewName("");
        return mv;
    }

    /**
     * 添加标签
     * @param articleId
     * @return
     */
    @RequestMapping(value = "/insert")
    public ModelAndView insertTag(String articleId){
        ModelAndView mv=new ModelAndView();
        List<Tag> tagList=articlesService.insertTag(articleId);
        if(tagList!=null && !tagList.isEmpty()){
            mv.setViewName("");
            return mv;
        }else{
            mv.setViewName("");
            return mv;
        }
    }

}
