package com.zlk.zlkproject.community.articleDetails.controller;

import com.zlk.zlkproject.community.articleDetails.service.ParticularsService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

/**
 * @author gby
 * @ClassName ParticularsController
 * @description 文章详情
 * @date 2019/11/21 11:11
 */
@RequestMapping(value = "/draft")
@Controller
public class ParticularsController {
    @Autowired
    private ParticularsService particularsService;

    /*
     * @descrption
     * @author gby
     * @param 跳转makedown编辑页面
     * @return java.lang.String
     * @date 2019/11/24 16:30
     */
    @RequestMapping(value = "/content")
    public String content() {

        return "/view/community/add";
    }

    /*
     * @descrption
     * @author gby
     * @param 新增文章内容
     * @return
     * @date 2019/11/24 16:19
     */
    @RequestMapping(value = "/add")
    public String add(Model model, String title, String articleId, @RequestParam("articleContent") String articleContent) throws Exception {
        particularsService.addArticleContent(title, articleId, articleContent);
        model.addAttribute("title", title);
        model.addAttribute("articleId", articleId);
        model.addAttribute("articleContent", articleContent);
        return "/view/community/title";
    }

    /*
     * @descrption 通过id查询文章
     * @author gby
     * @param [articleId]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/11/26 10:07
     */
    @RequestMapping(value = "/find/{articleId}", method = RequestMethod.GET)
    public ModelAndView find(@PathVariable("articleId")String articleId,HttpServletRequest request )throws Exception {
/*        String articleId1 = (String) request.getSession().getAttribute("articleId");*/
        Article article = particularsService.findById(articleId);
        ModelAndView mv = new ModelAndView();
        mv.addObject("article",article);
        mv.setViewName("/view/community/particulars");
        return mv;
    }



}
