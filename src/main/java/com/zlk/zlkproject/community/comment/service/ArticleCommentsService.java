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

    /**
     * @description: 新增文章评论
     * @param articleComment
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 9:34
     */
    Integer addArtCmt(ArticleComment articleComment);

    /**
     * @description: 查询文章评论按时间
     * @param articleId
     * @param page
     * @param size
     * @return: java.util.List<com.zlk.zlkproject.entity.ArticleComment>
     * @author: QianKeQin
     * @date: 2019/12/8 9:37
     */
    List<ArticleComment> findArtCmt(String articleId, Integer page, Integer size);

    /**
     * @description: 查询评论总条数
     * @param articleId
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 9:39
     */
    Integer findArtCmtCount(String articleId);

    /**
     * @description: 更新评论赞踩数
     * @param userId
     * @param articleCommentId
     * @param type
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 9:41
     */
    Integer updateZC(String userId, Integer articleCommentId, String type);

    /**
     * @description: 修改 article_comment inform数据
     * @param articleCommentId
     * @param inform
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 9:45
     */
    Integer updateArtCmtInform(Integer articleCommentId, String inform);
}
