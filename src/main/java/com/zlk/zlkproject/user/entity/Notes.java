package com.zlk.zlkproject.user.entity;

import java.util.Date;

public class Notes {
    private Integer snId;
    private Integer sectionId;
    private Integer userId;
    private String content;
    private Integer up;
    private Integer down;
    private String report;
    private Date date;

    public Notes(Integer snId, Integer sectionId, Integer userId, String content, Integer up, Integer down, String report, Date date) {
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
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
