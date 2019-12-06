package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName UserCourses
 * @Description:userCourses实体类
 * @Author LuanKe
 * Date 2019/11/22 18:06
 **/
@Setter
@Getter
@ToString
public class UserCourses {
    /**用户ID*/
    private String userId;
    /**课程ID*/
    private Integer coursesId;
    /**上次学习时间*/
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date lastStudyTime;

    public UserCourses(String userId, int coursesId, Date lastStudyTime) {
        this.userId = userId;
        this.coursesId = coursesId;
        this.lastStudyTime = lastStudyTime;
    }

    public UserCourses() {
    }
}
