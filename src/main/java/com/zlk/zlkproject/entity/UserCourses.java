package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @ClassName UserCourses
 * @Description:userCourses实体类
 * @Author LuanKe
 * Date 2019/11/22 18:06
 **/

public class UserCourses {
    private int userID;
    private int coursesId;
    private Date lastStudyTime;

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCoursesId() {
        return coursesId;
    }

    public void setCoursesId(int coursesId) {
        this.coursesId = coursesId;
    }

    public Date getLastStudyTime() {
        return lastStudyTime;
    }

    public void setLastStudyTime(Date lastStudyTime) {
        this.lastStudyTime = lastStudyTime;
    }

    public UserCourses(int userID, int coursesId, Date lastStudyTime) {
        this.userID = userID;
        this.coursesId = coursesId;
        this.lastStudyTime = lastStudyTime;
    }

    public UserCourses() {
    }

    @Override
    public String toString() {
        return "UserCourses{" +
                "userID=" + userID +
                ", coursesId=" + coursesId +
                ", lastStudyTime=" + lastStudyTime +
                '}';
    }
}
