package com.zlk.zlkproject.community.comment.controller;

import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.community.comment.service.CommentsService;
import com.zlk.zlkproject.community.entity.Comment;
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
public class CommentsController {

    @Autowired
    private CommentsService commentsService;

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
        articleId="871743534";
        model.addAttribute("comments", commentsService.listCommentByArticleId(articleId));
        return "view/community/articleShow";
    }

    @PostMapping(value = "/comments")
    public String post(Comment comment) {
        String articleId=comment.getArticle().getId();
        comment.setArticle(articleShowService.getArticle(articleId));
        comment.setAvatar(avatar);
        commentsService.saveComment(comment);
        return "redirect:/comments/" +articleId;
    }
}
