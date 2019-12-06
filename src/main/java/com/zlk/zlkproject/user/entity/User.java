package com.zlk.zlkproject.user.entity;

/**
 * @author 崔新睿
 * @data 2019/11/19 - 10:04
 */

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * 用户信息表实体类
 */
@Setter
@Getter
public class User {
    /*用户编号*/
    private String userId;
    /*手机号*/
    private String userPhonenum;
    /*密码*/
    private String userPwd;
    /*真实姓名*/
    private String userRealname;
    /*性别*/
    private String userSex;
    /*生日*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date userBirthday;
    /*籍贯*/
    private String userNative;
    /*婚否*/
    private String userMarry;
    /*所在城市*/
    private String userCity;
    /*现状（离职/在职）*/
    private String userState;
    /*目标职位*/
    private String userTarget;
    /*所属行业*/
    private String userIndustry;
    /*爱好*/
    private String userHobby;
    /*自我评价*/
    private String userSelfappraise;
    /*学历*/
    private String userEducation;
    /*所在院校*/
    private String userAcademy;
    /*所属专业*/
    private String userSpecialty;
    /*学习时间*/
    private int userAllTime;
    /*每日时长*/
    private int userDateTime;
    /*头像相对路径*/
    private String userImg;
    /*头像绝对路径*/
    private String userRealimg;

    /**
     * 无参构造方法
     */
    public User(){

    }
    /**
     * 有参构造
     */
    public User(String userId,String userPhonenum,String userPwd,String userRealname,String userSex,
                Date userBirthday, String userNative,String userMarry,String userCity,String userState,
                String userTarget,String userIndustry,String userHobby,String userSelfappraise,
                String userEducation,String userAcademy,String userSpecialty,int userAllTime,
                int userDateTime,String userImg,String userRealimg){

        this.userId=userId;
        this.userPhonenum=userPhonenum;
        this.userPwd=userPwd;
        this.userRealname=userRealname;
        this.userSex=userSex;
        this.userBirthday=userBirthday;
        this.userNative=userNative;
        this.userMarry=userMarry;
        this.userCity=userCity;
        this.userState=userState;
        this.userTarget=userTarget;
        this.userIndustry=userIndustry;
        this.userHobby=userHobby;
        this.userSelfappraise=userSelfappraise;
        this.userEducation=userEducation;
        this.userAcademy=userAcademy;
        this.userSpecialty=userSpecialty;
        this.userAllTime=userAllTime;
        this.userDateTime=userDateTime;
        this.userImg=userImg;
        this.userRealimg=userRealimg;



    }







}
