package com.zlk.zlkproject.community.comment.service;

import com.zlk.zlkproject.entity.ArticleComment;

import java.util.List;

/**
 * @program: CommentService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 14:46
 */
public interface ArticleCommentsService {

    List<ArticleComment> listCommentByArticleId(String articleId);

    ArticleComment saveComment(ArticleComment articleComment);
}
