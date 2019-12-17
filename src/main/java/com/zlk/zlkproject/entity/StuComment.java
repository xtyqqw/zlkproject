package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @program: zlkproject
 * @description: StuComment实体类
 * @author: hry
 * @create: 2019/12/03 11:02
 **/
@Getter
@Setter
@ToString
public class StuComment {
    /**表id 主键 对应字段sm_id*/
    private Integer smId;
    /**父id 对应字段pid*/
    private Integer pId;
    /**小节id 对应字段section_id*/
    private Integer sectionId;
    /**用户id 对应字段user_id*/
    private String userId;
    /**回复对象 对应字段reply_person*/
    private String replyPerson;
    /**评论内容 对应字段content*/
    private String content;
    /**赞数 对应字段up*/
    private Integer up;
    /**踩数 对应字段down*/
    private Integer down;
    /**举报 对应字段report*/
    private String report;
    /**创建时间 对应字段date*/
    private Date date;
    /** 对应讲师回复字段*/
    private String teacherAnswer;
    /**创建时间的字符串*/
    private String dateString;
    /**用户名 对应字段user_realname*/
    private String userRealName;
    /**用户头像 对应字段user_img*/
    private String userImg;
    /**子评论集合*/
    private List<StuComment> stuCommentList;
    /**赞踩集合*/
    private List<StuNoteUpDown> stuUpDownList;

    private String flag;
    /**章节Id*/
    private int chapterId;
    /**课程Id*/
    private int coursesId;
}
