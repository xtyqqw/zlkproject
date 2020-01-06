package com.zlk.zlkproject.entity;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Date;


/**
 * @author gby
 * @ClassName Reply
 * @description 社区回复表
 * @date 2019/12/24 16:47
 */
@ToString
@Getter
@Setter
public class Response {
    /**type为1表示为回答*/
    private Integer type = 1;
    /**主键Id*/
    private String responseId;
    /**对应问题Id*/
    private String questionId;
    /*用户id*/
    private String userId;
    /**问题内容*/
    private String responseContent;
    /**点赞数*/
    private Integer zanCount;
    /**踩数*/
    private Integer caiCount;
    /**评论数*/
    private Integer replyCount;
    /**是否已采纳 0未采纳 1采纳*/
    private Integer accept;
    /**回答时间*/
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**格式化后的时间*/
    private String formatDate;

    private Question question;

    private User user;

    public Response() {
    }
}
