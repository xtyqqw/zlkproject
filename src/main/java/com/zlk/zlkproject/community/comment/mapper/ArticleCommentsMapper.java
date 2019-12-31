package com.zlk.zlkproject.community.comment.mapper;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.ArticleComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: ArticleCommentsMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/8 9:49
 */

@Mapper
public interface ArticleCommentsMapper {

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
     * @description: 查询评论pid=0的条数
     * @param articleId
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 9:39
     */
    Integer findArtCmtCount(String articleId);

    /**
     * @description: 通过articleCommentId查询文章评论赞踩数
     * @param articleCommentId
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 9:41
     */
    ArticleComment findZanCaiNumByArticleCommentId(Integer articleCommentId);

    /**
     * @description: 通过articleCommentId更新文章评论赞踩数
     * @param articleCommentId
     * @param type
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 11:34
     */
    Integer updateZanCaiNumByArticleCommentId(Integer articleCommentId, String type);

    /**
     * @description: 增加 artcmt_user_zc 数据
     * @param articleCommentId
     * @param userId
     * @param zanOrCai
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 10:11
     */
    Integer addArtCmtUserZC(Integer articleCommentId, String userId, String zanOrCai);

    /**
     * @description: 删除 artcmt_user_zc 数据
     * @param articleCommentId
     * @param userId
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 10:14
     */
    Integer deleteArtCmtUserZC(Integer articleCommentId, String userId);

    /**
     * @description: 修改 artcmt_user_zc 数据
     * @param articleCommentId
     * @param userId
     * @param zanOrCai
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 10:16
     */
    Integer updateArtCmtUserZC(Integer articleCommentId, String userId, String zanOrCai);

    /**
     * @description: 修改 article_comment inform数据
     * @param articleCommentId
     * @param inform
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/8 9:45
     */
    Integer updateArtCmtInform(Integer articleCommentId, String inform);

    /**
     * @description: 更新评论数
     * @param article
     * @return: java.lang.Integer
     * @author: QianKeQin
     * @date: 2019/12/30 14:07
     */
    Integer countByArticle(Article article);
}
