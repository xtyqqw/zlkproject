package com.zlk.zlkproject.community.article.controller;

import com.zlk.zlkproject.admin.util.IDUtil;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.community.article.service.ArticleService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 张照伟
 * @program: ArticleController 文章管理控制类
 * @description:
 * @date 2019/11/23 9:35
 */
@Controller
@RequestMapping(value = "/article")
public class ArticleController {

    @Autowired
    private ArticleService articleService;
    @Autowired
    private LogUtil logUtil;

    /**
     * 跳转到文章管理页面
     * @param condition
     * @return
     */
    @RequestMapping(value = "/toArticleManager")
    public ModelAndView toArticleManager(String condition){
        ModelAndView mv= new ModelAndView();
        mv.addObject("condition",condition);
        mv.setViewName("admin/articleManager");
        return mv;
    }

    /**
     *当前端页面传过来的的String类型的日期与后台实体类的Date类型不匹配时，需要加上该方法
     * @param binder
     */
    @InitBinder
    public void init(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
    }

    /**
     * 文章管理接口
     * @param pagination
     * @return
     */
    @RequestMapping(value = "/articleManager")
    @ResponseBody
    public Map<String,Object> articleManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Article> articleList = articleService.selectArticleByLimit(pagination);
        Integer count = articleService.selectCountByTitle(pagination);
        map.put("code","0");
        map.put("data",articleList);
        map.put("count",count);
        return map;
    }

    /**
     * 添加文章
     * @param article
     * @return
     */
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Article article){
        ModelAndView mv=new ModelAndView();
        //判断文章标题是否重复
        Article articleByTitle = articleService.selectArticleByTitle(article.getTitle());
        if(articleByTitle != null){
            mv.addObject("flag","true");
            mv.addObject("msg","文章标题已存在");
            mv.setViewName("admin/articleManager");
            return mv;
        }
        article.setArticleId(IDUtil.getUUID());
        Integer flag = articleService.addArticle(article);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/articleManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","修改失败");
            mv.setViewName("admin/articleManager");
            return mv;
        }
    }

    /**
     * 通过文章id修改文章内容
     * @param article
     * @param request
     * @return
     */
    @RequestMapping(value = "/update")
    public ModelAndView update(Article article, HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        //判断文章是否更改，更改后判断更改后文章是否存在
        Article articleByTitle = articleService.selectArticleByTitle(article.getTitle());
        Article articleByArticleId = articleService.selectArticleByArticleId(article.getArticleId());
        if(!article.getTitle().equals(articleByArticleId.getTitle())&&articleByTitle!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","文章已存在");
            mv.setViewName("admin/articleManager");
            return mv;
        }
        //修改文章信息
        Integer flag = articleService.updateArticleByArticleId(article);
        if(flag == 1){
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("admin/articleManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","添加失败");
            mv.setViewName("admin/articleManager");
            return mv;
        }
    }

    /**
     * 通过文章id删除文章
     * @param articleId
     * @param request
     * @return
     */
    @RequestMapping(value = "/delete")
    @ResponseBody
    public String deleteArticleByArticleId(String articleId,HttpServletRequest request){
        //获取删除文章id
        Article articleByArticleId = articleService.selectArticleByArticleId(articleId);
        articleService.deleteArticleByArticleId(articleId);
        //日志记录删除文章
        logUtil.setLog(request,"删除文章标题为"+articleByArticleId.getTitle()+"的信息");

        return "admin/articleManager";
    }

}
