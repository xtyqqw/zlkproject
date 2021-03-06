package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName： Item
 * @Description： 项目需要的属性
 * @Author： sd
 * @Date： 2019/11/26 20:13
 */
@Setter
@Getter
public class Item {
    /*项目ID*/
    private Integer coursesId;
    /**课程名称*/
    private String coursesName;
    /**封面图片*/
    private String coverPic;
    /*章节名称*/
    private String chapterName;
    /*小节名称*/
    private String sectionName;
    /*观看时间*/
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date studyTime;
    /*格式化时间*/
    private String stuTime;
    private long per;
    /*获星数量*/
    private Integer sectionGrade;
    /*小节Id*/
    private Integer sectionId;
    /*状态*/
    private String state;

    public Item(Integer coursesId, String coursesName, String coverPic, String chapterName, String sectionName, Date studyTime, String stuTime, long per, Integer sectionGrade, Integer sectionId, String state) {
        this.coursesId = coursesId;
        this.coursesName = coursesName;
        this.coverPic = coverPic;
        this.chapterName = chapterName;
        this.sectionName = sectionName;
        this.studyTime = studyTime;
        this.stuTime = stuTime;
        this.per = per;
        this.sectionGrade = sectionGrade;
        this.sectionId = sectionId;
        this.state = state;
    }

    public Item() {
    }
}
