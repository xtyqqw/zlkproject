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
import org.springframework.web.servlet.ModelAndView;

/**
 * @program: CommentController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 14:34
 */

@Controller
public class CommentController {

    @Autowired
    private CommentsService commentsService;

    @Autowired
    private ArticleShowService articleShowService;

    @GetMapping(value = "/comments/{articleId}")
    public String comments(@PathVariable Long articleId, Model model) {
        model.addAttribute("comments", commentsService.listCommentByArticleId(articleId));
        return "view/community/articleShow :: commentList";
    }

    @PostMapping(value = "/comments")
    public String post(Comment comment) {
        Long articleId=comment.getArticle().getId();
        comment.setArticle(articleShowService.getArticle(articleId));
        commentsService.saveComment(comment);
        return "view/community/comments/" +articleId;
    }
}
