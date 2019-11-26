package com.zlk.zlkproject.community.comment.entity;

import com.zlk.zlkproject.entity.User;
import lombok.Getter;
import lombok.Setter;

/**
 * @program: ReplyComment
 * @description: 回复评论Bean类
 * @description: reply1(@comment)
 * @description: reply2(@reply1) 这条回复@了relpy1，但是也要发通知给comment和article
 * @author: QianKeQin
 * @date: 2019/11/21 9:39
 */

@Getter
@Setter
public class ReplyComment {

    private Integer id;
    private int articleId;
    private int commentId;
    /**创建这条回复的id*/
    private int replyUserId;
    /**读取评论的时候需要读取这个user信息*/
    private User user;
    /**这条回复的@人的id*/
    private int repliedUserId;
    private String content;
    /**对应数据库的回复日期timestamp类型*/
    private String createTime;

    public ReplyComment() {
    }

    public ReplyComment(int articleId, int commentId, int replyUserId, int repliedUserId, String content) {
        this.articleId = articleId;
        this.commentId = commentId;
        this.replyUserId = replyUserId;
        this.repliedUserId = repliedUserId;
        this.content = content;
    }
}
