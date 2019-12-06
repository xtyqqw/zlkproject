package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * @author gby
 * @ClassName question
 * @description 问答实体类
 * @date 2019/12/3 9:44
 */
@Getter
@Setter
@Entity
@Table(name = "question")
public class Question {
    /*问题表id uuid*/
    @Id
    private String questionId;
    /*问题标题*/
    private String questionTitle;
    /*问题内容*/
    private String questionContent;
    /*是否解决：0没有解决，1已解决，2待解决*/
    private String solve;
    /*发布时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /*浏览数*/
    private String browseCount;

    private String questionSetTop;
    /*用户表主键*/
    private Integer userId;

    private String figures;

    private String figuresReal;

    private String userRealname;

    private String userImg;
    /*获赞数*/
    private String zanCount;
    /*被踩数*/
    private String caiCount;
    /*审核：0 审核中，1 审核过，2 审核未过*/
    private String check;
    /*回答数*/
    private String responseCount;
    /*分类*/
    private String typeName;
    /**标签*/
    private String tagId;
    /*小节表主键*/
    private Integer sectionId;

    public Question() {
    }

}
