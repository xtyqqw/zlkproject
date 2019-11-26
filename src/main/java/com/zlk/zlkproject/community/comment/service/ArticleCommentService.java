package com.zlk.zlkproject.community.comment.service;

import com.zlk.zlkproject.community.comment.entity.ArticleComment;

import java.util.List;

/**
 * @program: ArticleCommentService
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/21 9:50
 */
public interface ArticleCommentService {

    List<ArticleComment> getArticleCommentsByArticleId(int id);

    int addArticleComment(ArticleComment articleComment);
}
