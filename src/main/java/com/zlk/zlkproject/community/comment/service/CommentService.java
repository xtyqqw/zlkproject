package com.zlk.zlkproject.community.comment.service;

import com.zlk.zlkproject.community.entity.Comment;

import java.util.List;

/**
 * @program: CommentService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 14:46
 */
public interface CommentService {

    List<Comment> listCommentByArticleId(Long articleId);

    Comment saveComment(Comment comment);
}
