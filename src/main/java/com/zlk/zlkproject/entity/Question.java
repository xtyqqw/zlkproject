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
    /*是否解决：0待解决，1已解决，2未解决*/
    private Integer solve;
    /*发布时间*/
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /*浏览数*/
    private String browseCount;
    /**
     * 问题置顶：0 置顶，1 不置顶
     */
    private String questionSetTop;
    /**
     * 相对路径
     */
    private String figures;
    /**
     * 插图相对路径
     */
    private String figuresReal;
    /*用户实际姓名*/
    private String userRealname;
    /*用户头像*/
    private String userImg;
    /*获赞数*/
    private Integer zanCount;
    /*被踩数*/
    private Integer caiCount;
    /*审核：0 审核中，1 审核过，2 审核未过*/
    private Integer check;
    /*回答数*/
    private String responseCount;
    /*分类*/
    private String typeName;
    /*小节表主键*/
    private String sectionId;
    /*标签*/
    private String tagName;
    /*用户*/
    private String userId;

    public Question() {
    }

}
