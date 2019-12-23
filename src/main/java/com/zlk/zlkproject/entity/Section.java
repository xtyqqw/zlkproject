package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * @program: zlkproject
 * @description: 小节实体类
 * @author: zyx
 * @create: 2019-11-19 11:56
 */
@Setter
@Getter
public class Section {

    /**小节id 主键 对应字段section_id*/
    private Integer sectionId;
    /**章节id 对应字段chapter_id*/
    private Integer chapterId;
    /**课程id*/
    private Integer courseId;
    /**章节id 对应字段section_name*/
    private String sectionName;
    /**视频地址 普清 对应字段video_addr1*/
    private String videoAddr1;
    /**视频地址 对应字段video_addr*/
    private String videoPath1;
    /**视频地址 对应字段video_addr*/
    private String videoAddr2;
    /**视频地址 对应字段video_addr*/
    private String videoPath2;
    /**小节视频时长 对应字段section_time*/
    private Integer sectionTime;
    /**修改前小节序号*/
    private Integer lastSectionNum;
    /**小节序号 对应字段section_num*/
    private Integer sectionNum;
    /**小节简介 对应数据库的 section_intro字段*/
    private String sectionIntro;

    private List<UserSection> userSectionList;

    public Section() {
    }

    public Section(Integer sectionId, Integer chapterId, String sectionName, String videoAddr1, String videoAddr2, Integer sectionTime, Integer sectionNum, String sectionIntro, List<UserSection> userSectionList) {
        this.sectionId = sectionId;
        this.chapterId = chapterId;
        this.sectionName = sectionName;
        this.videoAddr1 = videoAddr1;
        this.videoAddr2 = videoAddr2;
        this.sectionTime = sectionTime;
        this.sectionNum = sectionNum;
        this.sectionIntro = sectionIntro;
        this.userSectionList = userSectionList;
    }
}
