package com.zlk.zlkproject.user.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;
/*个人笔记*/
public class Notes {
    private Integer snId;
    private Integer sectionId;
    private String userId;
    private String content;
    private Integer up;
    private Integer down;
    private String report;
    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    private Date date;

    public Notes(Integer snId, Integer sectionId, String userId, String content, Integer up, Integer down, String report, Date date) {
        this.snId = snId;
        this.sectionId = sectionId;
        this.userId = userId;
        this.content = content;
        this.up = up;
        this.down = down;
        this.report = report;
        this.date = date;
    }

    public Notes() {
    }

    public Integer getSnId() {
        return snId;
    }

    public void setSnId(Integer snId) {
        this.snId = snId;
    }

    public Integer getSectionId() {
        return sectionId;
    }

    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getUp() {
        return up;
    }

    public void setUp(Integer up) {
        this.up = up;
    }

    public Integer getDown() {
        return down;
    }

    public void setDown(Integer down) {
        this.down = down;
    }

    public String getReport() {
        return report;
    }

    public void setReport(String report) {
        this.report = report;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
