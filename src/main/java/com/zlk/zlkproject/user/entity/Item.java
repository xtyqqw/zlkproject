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
    private String StuTime;
    public Item(String coursesName, String coverPic, String chapterName, String sectionName, Date studyTime) {
        this.coursesName = coursesName;
        this.coverPic = coverPic;
        this.chapterName = chapterName;
        this.sectionName = sectionName;
        this.studyTime = studyTime;
    }

    public Item() {
    }
}
