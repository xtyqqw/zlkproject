package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 章节实体类
 * @author: zyx
 * @create: 2019-11-19 11:46
 */
@Setter
@Getter
public class Chapter {

    /**章节id 主键 对应字段chapter_id*/
    private Integer chapterId;
    /**课程id 对应字段courses_id*/
    private Integer coursesId;
    /**章节名称 对应字段chapter_name*/
    private String chapterName;
    /**章节视频总时间 对应字段chapter_time*/
    private Date chapterTime;
    /**章节序号 对应字段chapter_num*/
    private Integer chapterNum;
    /**小节列表*/
    private List<Section> sectionList;

    public Chapter() {
    }

    public Chapter(Integer chapterId, Integer coursesId, String chapterName, Date chapterTime, Integer chapterNum, List<Section> sectionList) {
        this.chapterId = chapterId;
        this.coursesId = coursesId;
        this.chapterName = chapterName;
        this.chapterTime = chapterTime;
        this.chapterNum = chapterNum;
        this.sectionList = sectionList;
    }
}
