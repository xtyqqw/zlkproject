package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

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
    /*是否解决：0待解决，1已解决*/
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
    private Integer browseCount;
    /**问题置顶： 1置顶，0不置顶*/
    private String questionSetTop;
    /*审核： 0 正在审核， 1 审核通过，2 审核未过*/
    private String audit;
    /*类别*/
    private String typeName;
    /*回答数*/
    private Integer responseCount;
    /**添加文章时此属性做标签多选用，且不会在数据库中创建该字段*/
    @Transient
    private String tagIds;

    /**问题和标签多对多关系*/
    @ManyToMany(cascade = {CascadeType.PERSIST})
    @JoinTable(name = "question_tag",joinColumns = {@JoinColumn(name = "question_id",referencedColumnName = "questionId")},
            inverseJoinColumns = {@JoinColumn(name = "tag_id",referencedColumnName = "tagId")})
    private List<Tag> tags=new ArrayList<>();

    /**提问和用户多对一关系*/
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Question() {
    }

}
