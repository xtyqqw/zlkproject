package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * (StuNote)实体类
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/27 13:42
 */
@Setter
@Getter
@ToString
public class StuNote {
    /**
     * 笔记ID 对应数据库的 sn_id 字段
     */
    private Integer snId;

    /**
     * 小节ID 对应数据库的 section_id 字段
     */
    private Integer snSectionId;

    /**
     * 用户ID 对应数据库的 user_id 字段
     */
    private String snUserId;

    /**
     * 笔记内容 对应数据库的 content 字段
     */
    private String content;

    /**
     * 赞 对应数据库的 up 字段
     */
    private Integer up;

    /**
     * 踩 对应数据库的 down 字段
     */
    private Integer down;

    /**
     * 举报 对应数据库的 report 字段
     */
    private String report;

    /**
     * 日期 对应数据库的 report 字段
     */
    private Date date;

    public StuNote() {
    }

    public StuNote(Integer snId, Integer snSectionId, String snUserId, String content, Integer up, Integer down, String report, Date date) {
        this.snId = snId;
        this.snSectionId = snSectionId;
        this.snUserId = snUserId;
        this.content = content;
        this.up = up;
        this.down = down;
        this.report = report;
        this.date = date;
    }
}
