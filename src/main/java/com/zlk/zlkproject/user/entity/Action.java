package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.util.Date;

/**
 * @program: Action
 * @description: 评论实体类
 * @author: xty
 * @create: 2019/11/25 14:51
 **/
@Getter
@Setter
@ToString
@Entity
@Table(name = "actions")
public class Action {
    /**id表格主键*/
    @Id
    private String actionId;
    /**用户操作类型
     * 包括：1.发布文章 2.评论文章 3.回复评论
     *      4.提出问题 5.回答问题 6.回复答案
     * */
    private String actionType;
    /**用户动作对应文章id*/
    private String articleId;
    /**用户评论时间*/
    private Date createTime;
    /**用户id*/
    private String userId;
    /**回复用户id*/
    private String replyUserId;

    public Action(String actionId, String actionType, String articleId, Date createTime, String userId, String replyUserId) {
        this.actionId = actionId;
        this.actionType = actionType;
        this.articleId = articleId;
        this.createTime = createTime;
        this.userId = userId;
        this.replyUserId = replyUserId;
    }

    public Action() {
    }
}
