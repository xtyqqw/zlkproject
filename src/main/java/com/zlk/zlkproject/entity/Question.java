package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author gby
 * @ClassName question
 * @description 问答实体类
 * @date 2019/12/3 9:44
 */

@Getter
@Setter
@Entity
public class Question {
    /*问题表id uuid*/
    @Id
    private String questionId;
    /*问题标题*/
    private String questionTitle;
    /*问题内容*/
    private String questionContent;
    /*问题Html格式*/
    private String questionContentHtml;
    /*问题简要*/
    private String questionSynopsis;
    /*是否解决：待解决，已解决*/
    private String solve;
    /*发布时间*/
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**更新时间*/
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    /*浏览数*/
    private String browseCount;
    /**问题置顶： 置顶，不置顶*/
    private String questionSetTop;
    /*审核： 审核中， 审核过， 审核未过*/
    private String audit;
    /*类别*/
    private String typeName;
    /*标签*/
    private String tagName;
    /*小节表主键*/
    private String sectionId;
    /**提问和用户多对一关系*/
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Question() {
    }

}
