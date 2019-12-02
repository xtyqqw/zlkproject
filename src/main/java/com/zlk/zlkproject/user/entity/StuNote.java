package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;

/**
 * @ClassName： StuNote
 * @Description： 学生笔记实体类
 * @Author： yzh
 * @Date： 2019/11/28 9:48
 */
@Getter
@Setter
@ToString
public class StuNote {
    /**我的笔记ID*/
    private Integer snId;
    /**小节ID*/
    private Integer snSectionId;
    /**用户ID*/
    private String snUserId;
    /**笔记内容*/
    private String content;
    /**点赞数*/
    private Integer up;
    /**点灭数*/
    private Integer down;
    /**举报*/
    private String report;
    /**笔记时间*/
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm")
    private Date snDate;

    public StuNote() {
    }

    public StuNote(Integer snId, Integer snSectionId, String snUserId, String content, Integer up, Integer down, String report, Date snDate) {
        this.snId = snId;
        this.snSectionId = snSectionId;
        this.snUserId = snUserId;
        this.content = content;
        this.up = up;
        this.down = down;
        this.report = report;
        this.snDate = snDate;
    }
}
