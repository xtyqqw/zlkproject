package com.zlk.zlkproject.community.articleManager.controller;

import com.alibaba.fastjson.JSONArray;
import com.zlk.zlkproject.admin.util.IDUtil;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.community.articleAdd.service.ActionAddService;
import com.zlk.zlkproject.community.articleManager.service.ArticleManagerService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
 * @program: ArticleManagerController 文章管理控制类
 * @description:文章管理的Controller类
 * @date 2019/11/27 9:35
 */
@Controller
@RequestMapping(value = "/article")
public class ArticleManagerController {

    @Autowired
    private ArticleManagerService articleManagerService;
    @Autowired
    private LogUtil logUtil;
    @Autowired
    private ActionAddService actionAddService;

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
     *当前端页面传过来的String类型的日期与后台实体类的Date类型不匹配时，需要加上该方法
     * @param binder
     */
    @InitBinder
    public void init(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"), true));
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
        List<Article> articleList = articleManagerService.selectArticleByLimit(pagination);
        Integer count = articleManagerService.selectCountByTitle(pagination);
        map.put("code","0");
        map.put("data",articleList);
        map.put("count",count);
        return map;
    }

    /**
     * 添加文章，仅限于测试为数据库添加数据使用，后期项目测试时删除或注释
     * @param article
     * @return
     */
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Article article){
        ModelAndView mv=new ModelAndView();
        /**判断文章标题是否重复*/
        List<Article> articleByTitle = articleManagerService.selectArticleByTitle(article.getTitle());
        if(articleByTitle != null){
            mv.addObject("flag","true");
            mv.addObject("msg","文章标题已存在");
            mv.setViewName("admin/articleManager");

            return mv;
        }
        article.setArticleId(IDUtil.getUUID());
        Integer flag = articleManagerService.addArticle(article);
        if(flag==1){
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
     * 通过文章id修改文章内容
     * @param article
     * @param request
     * @return
     */
    @RequestMapping(value = "/update")
    public ModelAndView update( Article article, HttpServletRequest request, Action action){
        ModelAndView mv=new ModelAndView();
        /**判断文章是否更改，更改后判断更改后的文章是否存在*/
        List<Article> articleByTitle = articleManagerService.selectArticleByTitle(article.getTitle());
        Article articleByArticleId = articleManagerService.selectArticleByArticleId(article.getArticleId());

        if(!article.getTitle().equals(articleByArticleId.getTitle())&&articleByTitle!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","文章已存在");
            mv.setViewName("admin/articleManager");
            return mv;
        }
        /**修改文章信息，修改完成提交，提示:修改成功；否则，提示：修改失败*/
        /*Article articles1 = articleManagerService.selectArticleByArticleId(article.getArticleId());
        mv.addObject("articles",articles1);
        mv.setViewName("admin/articleManagerEdit");*/

        Integer flag = articleManagerService.updateArticleByArticleId(article);
        if(flag == 1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/articleManager");
            //日志记录修改文章
            logUtil.setLog(request," 修改文章标题为"+articleByArticleId.getTitle()+"的信息");

            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","修改失败");
            mv.setViewName("admin/articleManager");
            return mv;
        }
    }

    /**
     * 点击跳转回显文章内容，展示markdown
     * @param articles
     * @return
     */
    @RequestMapping(value = "/toUpdate")
    public ModelAndView updateBtu(Article articles){
        ModelAndView mv=new ModelAndView();
        Article articles1 = articleManagerService.selectArticleByArticleId(articles.getArticleId());
        mv.addObject("articles",articles1);
        mv.setViewName("admin/articleManagerEdit");
        return mv;
    }

    /**
     * 通过文章id删除文章
     * @param articleId
     * @param request
     * @return
     */
    @RequestMapping(value = "/delete")

    public String deleteArticleByArticleId(String articleId,HttpServletRequest request){
        /**获取删除文章id*/
        Article articleByArticleId = articleManagerService.selectArticleByArticleId(articleId);
        articleManagerService.deleteArticleByArticleId(articleId);
        //日志记录删除文章
        logUtil.setLog(request,"删除文章标题为"+articleByArticleId.getTitle()+"的信息");

        return "admin/articleManager";
    }

    /**
     * 通过文章id批量删除文章
     * @param data
     * @return
     */
    @RequestMapping(value = "/deleteList")
    @ResponseBody
    public String deleteArticlesByArticleId(String data){
        List<Article> articleList = JSONArray.parseArray(data, Article.class);
        Integer flag = articleManagerService.deleteArticlesByArticleId(articleList);
        return "admin/articleManager";
    }

}
