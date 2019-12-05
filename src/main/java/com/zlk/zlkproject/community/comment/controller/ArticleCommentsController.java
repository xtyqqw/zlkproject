package com.zlk.zlkproject.community.comment.controller;

import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.community.comment.service.ArticleCommentsService;
import com.zlk.zlkproject.entity.ArticleComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 * @program: CommentController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 14:34
 */

@Controller
public class ArticleCommentsController {

    @Autowired
    private ArticleCommentsService commentsService;

    @Autowired
    private ArticleShowService articleShowService;

    @Value("${comment.avatar}")
    private String avatar;

    /*@GetMapping(value = "/comments/{articleId}")
    public ModelAndView comments(@PathVariable String articleId) {
        ModelAndView mv=new ModelAndView();
        mv.addObject("comments",commentsService.listCommentByArticleId(articleId));
        mv.setViewName("view/community/articleShow");
        return mv;
    }*/

    @GetMapping(value = "/comments/{articleId}")
    public String comments(@PathVariable String articleId, Model model) {
        model.addAttribute("comments", commentsService.listCommentByArticleId(articleId));
        return "view/community/articleShow";
    }

    @PostMapping(value = "/comments")
    public String post(ArticleComment articleComment) {
        String articleId=articleComment.getArticle().getArticleId();
        articleComment.setArticle(articleShowService.getArticle(articleId));
        articleComment.setAvatar(avatar);
        commentsService.saveComment(articleComment);
        return "redirect:/comments/" +articleId;
    }
}
