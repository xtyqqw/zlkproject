package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @program: zlkproject
 * @description: 课程实体类
 * @author: zyx
 * @create: 2019-11-19 11:19
 */
@Setter
@Getter
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
    /**章节列表*/
    private List<Chapter> chapterList;
    /**上次学习时间列表*/
    /*private List<UserCourses> UserCoursesList;*/

    public Courses(Integer coursesId, String coursesName, Integer studentNum, Integer chapterNum, Integer sectionNum, Double price, String coverPic, String introduceVideo, String introduceText, String introducePic, String featureText, String featurePic) {
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
    }

    public Courses() {
    }
}
