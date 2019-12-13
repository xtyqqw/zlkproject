package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
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
    /**对应问题Id*/
    private String questionId;
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
    /*用户*/
    private String userId;
}
