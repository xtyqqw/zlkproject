package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: zlkproject
 * @description: StuNoteRes工具类
 * @author: hry
 * @create: 2019/11/28 11:02
 **/
@Getter
@Setter
@ToString
public class StuNoteRes {
    /**表id 主键 对应字段sn_id*/
    private Integer snId;
    /**小节id 对应字段section_id*/
    private Integer sectionId;
    /**用户id 对应字段user_id*/
    private String userId;
    /**笔记内容 对应字段content*/
    private String content;
    /**赞数 对应字段up*/
    private Integer up;
    /**踩数 对应字段down*/
    private Integer down;
    /**举报 对应字段report*/
    private String report;
    /**举报 对应字段collect*/
    private Integer collect;
    /**创建时间 对应字段date*/
    private Date date;
    /**创建时间的字符串*/
    private String dateString;
    /**用户姓名*/
    private String userRealName;
    /**头像图片相对路径*/
    private String userImg;
    /**赞踩集合*/
    private List<StuNoteUpDown> stuNoteUpDown;
    /**采集集合*/
    private List<StuNoteCollect> stuNoteCollect;
}
