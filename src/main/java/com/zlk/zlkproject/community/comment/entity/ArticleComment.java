package com.zlk.zlkproject.community.comment.entity;

import com.zlk.zlkproject.entity.User;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @program: ArticleComment
 * @description: 文章评论Bean类
 * @author: QianKeQin
 * @date: 2019/11/21 9:36
 */

@Getter
@Setter
public class ArticleComment {

    /**主键id*/
    private Integer id;
    /**创建该评论的用户id*/
    private int commentUserId;
    private User user;
    /**评论的文章id*/
    private int articleId;
    /**评论内容*/
    private String content;
    /**对应数据库的评论日期timestamp类型*/
    private String createTime;
    private List<ReplyComment> replyCommentList;

    public ArticleComment() {
    }

    public ArticleComment(int commentUserId, int articleId, String content) {
        this.commentUserId = commentUserId;
        this.articleId = articleId;
        this.content = content;
    }
}
