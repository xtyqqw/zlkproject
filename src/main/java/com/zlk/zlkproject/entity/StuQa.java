package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 学生问答实体类
 * @author: zyx
 * @create: 2019-11-27 14:41
 */
@Setter
@Getter
@ToString
public class StuQa {

    /**问答id 对应字段 sqa_id*/
    private Integer sqaId;
    /**问答父id 对应字段 pid*/
    private Integer pId;
    /**小节id 对应字段 section_id*/
    private Integer sectionId;
    /**用户id 对应字段 user_id*/
    private Integer userId;
    /**问答内容 对应字段 content*/
    private String content;
    /**回答数量 对应字段 answer_num*/
    private Integer answerNum;
    /**浏览数量 对应字段 view_num*/
    private Integer viewNum;
    /**分享状态 对应字段 share*/
    private String share;
    /**举报状态 对应字段 report*/
    private String report;
    /**问答日期 对应字段 date*/
    @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
    private Date date;
    /**与标签表多对多关联*/
    private List<Tag> tagList;

    public StuQa() {
    }

    public StuQa(Integer sqaId, Integer pId, Integer sectionId, Integer userId, String content, Integer answerNum, Integer viewNum, String share, String report, Date date) {
        this.sqaId = sqaId;
        this.pId = pId;
        this.sectionId = sectionId;
        this.userId = userId;
        this.content = content;
        this.answerNum = answerNum;
        this.viewNum = viewNum;
        this.share = share;
        this.report = report;
        this.date = date;
    }
}
