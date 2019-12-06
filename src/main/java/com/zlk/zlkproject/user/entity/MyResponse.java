package com.zlk.zlkproject.user.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

/**
 * @program: MyResponse
 * @description: 我的回答实体类
 * @author: xty
 * @create: 2019/12/3 11:25
 **/
public class MyResponse {
    /**type为1表示为回答*/
    private Integer type = 1;
    /**主键Id*/
    private Integer responseId;
    /**对应问题Id*/
    private Integer questionId;
    /**问题内容*/
    private String responseContent;
    /**点赞数*/
    private Integer zanCount;
    /**踩数*/
    private Integer caiCount;
    /**评论数*/
    private Integer replyCount;
    /**是否已采纳*/
    private Integer accept;
    /**回答时间*/
    @JsonFormat(timezone = "GMT+8")
    private Date createTime;
    /**格式化后的时间*/
    private String formatDate;

    public Integer getResponseId() {
        return responseId;
    }

    public void setResponseId(Integer responseId) {
        this.responseId = responseId;
    }

    public Integer getType() {
        return type;
    }

    public String getFormatDate() {
        return formatDate;
    }

    public void setFormatDate(String formatDate) {
        this.formatDate = formatDate;
    }

    public Integer getQuestionId() {
        return questionId;
    }

    public void setQuestionId(Integer questionId) {
        this.questionId = questionId;
    }

    public String getResponseContent() {
        return responseContent;
    }

    public void setResponseContent(String responseContent) {
        this.responseContent = responseContent;
    }

    public Integer getZanCount() {
        return zanCount;
    }

    public void setZanCount(Integer zanCount) {
        this.zanCount = zanCount;
    }

    public Integer getCaiCount() {
        return caiCount;
    }

    public void setCaiCount(Integer caiCount) {
        this.caiCount = caiCount;
    }

    public Integer getReplyCount() {
        return replyCount;
    }

    public void setReplyCount(Integer replyCount) {
        this.replyCount = replyCount;
    }

    public Integer getAccept() {
        return accept;
    }

    public void setAccept(Integer accept) {
        this.accept = accept;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
