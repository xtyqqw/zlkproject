package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * @program: zlkproject
 * @description: 教师笔记实体类
 * @author: zyx
 * @create: 2019-11-21 17:44
 */
@Setter
@Getter
@ToString
public class TeacherNote {

    /**教师笔记id*/
    private Integer tnId;
    /**课程小节id*/
    private Integer sectionId;
    /**教师笔记标题*/
    private String title;
    /**教师笔记内容*/
    private String content;
    /**教师笔记创建日期*/
    private Date date;

    public TeacherNote() {
    }

    public TeacherNote(Integer tnId, Integer sectionId, String title, String content, Date date) {
        this.tnId = tnId;
        this.sectionId = sectionId;
        this.title = title;
        this.content = content;
        this.date = date;
    }

}
