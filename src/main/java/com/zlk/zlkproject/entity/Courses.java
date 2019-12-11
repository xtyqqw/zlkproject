package com.zlk.zlkproject.entity;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Date;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 课程实体类
 * @author: zyx
 * @create: 2019-11-19 11:19
 */
@Getter
@Setter
@ToString
public class Courses {

    /**课程id*/
    private Integer coursesId;
    /**课程名称*/
    private String coursesName;
    /**学习人数*/
    private Integer studentNum;
    /**章节数量*/
    private Integer chapterNum;
    /**小节数量*/
    private Integer sectionNum;
    /**课程价格*/
    private Double price;
    /**封面图片*/
    private String coverPic;
    /**介绍视频*/
    private String introduceVideo;
    /**介绍文本*/
    private String introduceText;
    /**介绍图片*/
    private String introducePic;
    /**功能文本*/
    private String featureText;
    /**功能图片*/
    private String featurePic;
    /**章节Id*/
    private int typeId;
    /**小节Id*/
    private int coursesTagId;

    /**章节列表*/
    private List<Chapter> chapterList;
    /**用户Id*/
    private  String  userId;
    /**中间表Id*/
    private  int  userCoursesId;
    /**最后学习时间*/
    @DateTimeFormat(pattern = "yy-MM-dd ")
    private Date  lastStudyTime;
    /**标签 Id*/
    private int tagId;
    /**标签名字*/
    private String tagName;
    /**标签属性Id*/
    private String tagTypeId;

    public Courses(Integer coursesId, String coursesName, Integer studentNum, Integer chapterNum, Integer sectionNum, Double price, String coverPic, String introduceVideo, String introduceText, String introducePic, String featureText, String featurePic, List<Chapter> chapterList, String userId, int userCoursesId, Date lastStudyTime, int tagId, String tagName, String tagTypeId) {
        this.coursesId = coursesId;
        this.coursesName = coursesName;
        this.studentNum = studentNum;
        this.chapterNum = chapterNum;
        this.sectionNum = sectionNum;
        this.price = price;
        this.coverPic = coverPic;
        this.introduceVideo = introduceVideo;
        this.introduceText = introduceText;
        this.introducePic = introducePic;
        this.featureText = featureText;
        this.featurePic = featurePic;
        this.chapterList = chapterList;
        this.userId = userId;
        this.userCoursesId = userCoursesId;
        this.lastStudyTime = lastStudyTime;
        this.tagId = tagId;
        this.tagName = tagName;
        this.tagTypeId = tagTypeId;
    }

    public Courses() {
    }
}
