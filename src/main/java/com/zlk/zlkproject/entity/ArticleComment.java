package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @program: ArticleComment
 * @description: 文章评论实体类
 * @author: QianKeQin
 * @date: 2019/12/5 10:41
 */

@Getter
@Setter
@ToString
public class ArticleComment {

    /**主键 对应字段article_comment_id*/
    private Integer articleCommentId;
    /**父id 对应字段pid*/
    private Integer pId;
    /**小节id 对应字段article_id*/
    private String articleId;
    /**用户id 对应字段user_id*/
    private String userId;
    /**回复对象 对应字段reply_person*/
    private String replyPerson;
    /**评论内容 对应字段content*/
    private String content;
    /**赞数 对应字段zan*/
    private Integer zan;
    /**踩数 对应字段cai*/
    private Integer cai;
    /**举报 对应字段inform*/
    private Integer inform;
    /**创建时间 对应字段date*/
    private Date date;
    /**创建时间的字符串*/
    private String dateString;
    /**用户名 对应字段user_realname*/
    private String userRealName;
    /**用户头像 对应字段user_img*/
    private String userImg;
    /**子评论集合*/
    private List<ArticleComment> articleCommentList;
    /**赞踩集合*/
    private List<ArticleCommentZanCai> articleCommentZanCaiList;
}
