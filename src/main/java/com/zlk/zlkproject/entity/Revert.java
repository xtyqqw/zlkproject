package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

/**
 * @author gby
 * @ClassName Reply
 * @description 社区回复表
 * @date 2019/12/24 16:47
 */
@Entity
@Getter
@Setter
public class Revert {
    @Id
    /*回答用户id*/
    private String revertId;
    /*回复内容*/
    private String revertContent;
    /*回复时间*/
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /*赞*/
    private Integer zanCount;
    /*踩*/
    private Integer caiCount;
    /*回复数*/
    private Integer revertCount;
    /*是否被采纳，0没有，1采纳*/
    private String accep;
    /*问题id*/
    private String questionId;
    /*用户id*/
    private String userId;

    public Revert(String revertId, String revertContent, Date createTime, Integer zanCount, Integer caiCount, Integer revertCount, String accep, String questionId, String userId) {
        this.revertId = revertId;
        this.revertContent = revertContent;
        this.createTime = createTime;
        this.zanCount = zanCount;
        this.caiCount = caiCount;
        this.revertCount = revertCount;
        this.accep = accep;
        this.questionId = questionId;
        this.userId = userId;
    }

    public Revert() {
    }
}
