package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.util.Date;

/**
 * @author gby
 * @ClassName Response
 * @description 社区回答
 * @date 2019/12/11 16:17
 */
@Entity
@Getter
@Setter
public class Response {
    @Id
    /**主键Id*/
    private String responseId;
    /**回答内容*/
    private String responseContent;
    /**回答时间*/
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**点赞数*/
    private Integer zanCount;
    /**踩数*/
    private Integer caiCount;
    /**评论数*/
    private Integer replyCount;
    /**提问和用户多对一关系*/
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;
    /**回答和提问多对一关系*/
    @ManyToOne
    @JoinColumn(name = "question_id")
    private Question question;
}
