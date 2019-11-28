package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * @program: UserAction
 * @description: 用户动态类 主要作用为向前台传相应参数
 * @author: xty
 * @create: 2019/11/26 13:41
 **/
@Getter
@Setter
@ToString
public class UserAction {
    /**id表格主键*/
    private String actionId;
    /**用户id*/
    private String userId;
    /**用户名*/
    private String userName;
    /**
     * 用户动作类型
     * 包括：1.发布文章 2.评论文章 3.回复评论
     *      4.提出问题 5.回答问题 6.回复答案
     * */
    private Integer actionType;
    /**
     * 被评论人id
     * 当 动作类型为1/2/4/5时该词条为空
     * 当 动作类型为3/6时通过该属性查出被评论人
     * */
    private String replyUserId;
    /**
     * 被评论人
     * 当动作为1/2/4/5时不填
     * 当为其他动作时通过replyUserId查出并赋值
     * */
    private String replyUser;
    /**
     * 文章或问题发布人
     * 当动作为1/4时不填
     * 当为其他动作时通过 文章/问题id查出并赋值
     * */
    private String problemUser;
    /**用户动作对应文章id*/
    private String articleId;
    /**
     * 文章或问题名称
     * 通过对应文章id查询
     * */
    private String articleName;
    /**动态创建时间*/
    private Date creatTime;
    /**格式化后的时间*/
    private String dateFormat;
    /**距离当前时间*/
    private String leaveTime;

    public UserAction() {
    }

    public UserAction(String actionId, String userId, String userName, Integer actionType, String replyUserId, String replyUser, String problemUser, String articleId, String articleName, Date creatTime, String dateFormat, String leaveTime) {
        this.actionId = actionId;
        this.userId = userId;
        this.userName = userName;
        this.actionType = actionType;
        this.replyUserId = replyUserId;
        this.replyUser = replyUser;
        this.problemUser = problemUser;
        this.articleId = articleId;
        this.articleName = articleName;
        this.creatTime = creatTime;
        this.dateFormat = dateFormat;
        this.leaveTime = leaveTime;
    }
}
