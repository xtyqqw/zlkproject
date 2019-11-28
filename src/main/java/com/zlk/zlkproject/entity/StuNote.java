package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * @program: zlkproject
 * @description: StuNote实体类
 * @author: hry
 * @create: 2019/11/27 11:13
 **/
@Getter
@Setter
@ToString
public class StuNote {
    /**表id 主键 对应字段sn_id*/
    private Integer snId;
    /**小节id 对应字段section_id*/
    private Integer sectionId;
    /**用户id 对应字段user_id*/
    private Integer userId;
    /**笔记内容 对应字段content*/
    private String content;
    /**赞数 对应字段up*/
    private Integer up;
    /**踩数 对应字段down*/
    private Integer down;
    /**举报 对应字段report*/
    private String report;
    /**创建时间 对应字段date*/
    private Date date;
}
