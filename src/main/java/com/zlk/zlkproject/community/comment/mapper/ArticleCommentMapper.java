package com.zlk.zlkproject.community.comment.mapper;

import com.zlk.zlkproject.community.comment.entity.ArticleComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: ArticleCommentMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/21 10:19
 */

@Mapper
public interface ArticleCommentMapper {

    List<ArticleComment> getArticleCommentsByArticleId(int id);

    int addArticleComment(ArticleComment articleComment);
}
