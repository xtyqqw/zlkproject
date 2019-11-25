package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

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
    /**章节id 对应字段section_name*/
    private String sectionName;
    /**视频地址 对应字段video_addr*/
    private String videoAddr;
    /**小节视频时长 对应字段section_time*/
    private Integer sectionTime;
    /**小节序号 对应字段section_num*/
    private Integer sectionNum;

    public Section() {
    }

    public Section(Integer sectionId, Integer chapterId, String sectionName, String videoAddr, Integer sectionTime, Integer sectionNum) {
        this.sectionId = sectionId;
        this.chapterId = chapterId;
        this.sectionName = sectionName;
        this.videoAddr = videoAddr;
        this.sectionTime = sectionTime;
        this.sectionNum = sectionNum;
    }
}
