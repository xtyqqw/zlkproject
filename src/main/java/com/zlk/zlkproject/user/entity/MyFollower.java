package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

/**
 * @program: MyFollower
 * @description: 我的关注用于向前台传输信息的实体类
 * @author: xty
 * @create: 2019/11/26 15:56
 **/
@Getter
@Setter
@ToString
public class MyFollower {
    /**用户id  32位uuid*/
    private String userId;
    /**用户姓名*/
    private String userRealname;
    /**用户每日学习时长*/
    private Integer userDateTime;
    /**用户总学习时间(小时数)*/
    private Integer userAllTime;
    /**头像图片相对路径*/
    private String userImg;
    /**头像图片绝对路径*/
    private String userRealimg;
    /**被关注人数*/
    private Integer followerNum;
    /**已关注人数*/
    private Integer followedNum;
    /**学习力*/
    private Integer studyPower;
    /**学习效率*/
    private Integer studyEfficiency;
    /**学习时长*/
    private Integer studyTime;
    /**学习成长量*/
    private Integer studyGrowup;
    /**技能水平*/
    private Integer studyStandard;
    /**动态集合*/
    private List<UserAction> list;

    public MyFollower(String userId, String userRealname, Integer userDateTime, Integer userAllTime, String userImg, String userRealimg, Integer followerNum, Integer followedNum, Integer studyPower, Integer studyEfficiency, Integer studyTime, Integer studyGrowup, Integer studyStandard, List<UserAction> list) {
        this.userId = userId;
        this.userRealname = userRealname;
        this.userDateTime = userDateTime;
        this.userAllTime = userAllTime;
        this.userImg = userImg;
        this.userRealimg = userRealimg;
        this.followerNum = followerNum;
        this.followedNum = followedNum;
        this.studyPower = studyPower;
        this.studyEfficiency = studyEfficiency;
        this.studyTime = studyTime;
        this.studyGrowup = studyGrowup;
        this.studyStandard = studyStandard;
        this.list = list;
    }

    public MyFollower() {
    }
}
