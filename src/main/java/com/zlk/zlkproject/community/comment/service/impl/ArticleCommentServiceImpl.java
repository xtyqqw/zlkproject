package com.zlk.zlkproject.community.comment.service.impl;

import com.zlk.zlkproject.community.comment.entity.ArticleComment;
import com.zlk.zlkproject.community.comment.mapper.ArticleCommentMapper;
import com.zlk.zlkproject.community.comment.service.ArticleCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ArticleCommentServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/21 10:21
 */

@Service
public class ArticleCommentServiceImpl implements ArticleCommentService {

    @Autowired
    private ArticleCommentMapper articleCommentMapper;

    @Override
    public List<ArticleComment> getArticleCommentsByArticleId(int id) {
        return articleCommentMapper.getArticleCommentsByArticleId(id);
    }

    @Override
    public int addArticleComment(ArticleComment articleComment) {
        return articleCommentMapper.addArticleComment(articleComment);
    }
}
