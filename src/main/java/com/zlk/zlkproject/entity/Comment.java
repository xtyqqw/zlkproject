package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;
import java.util.List;

/**
 * @ClassName comment
 * @Description: 评论实体类
 * @Author LuanKe
 * Date 2019/11/27 9:17
 **/
@Getter
@Setter
@ToString
public class Comment {
    /**评论id  */
     private int commentId;
    /**用户id  */
     private String commentUserId;
    /**评论  */
     private String comments;
    /**讲师回复 */
     private String teacherAnswer;
    /** 点赞数 */
    private int like;
    /** 踩数 */
    private int dislike;
    /** 定义全局变量为了显示前三热门评论*/
    private String flag;
    /**用户id  32位uuid*/
    private String userId;
    /**用户手机号*/
    private String phonenum;
    /**用户密码
     * MD5加密*/
    private String userPwd;
    /**用户姓名*/
    private String userRealname;
    /**用户性别*/
    private String userSex;
    /**用户出生年月*/
    private Date userBirthday;
    /**用户籍贯*/
    private String userNative;
    /**用户结婚状态*/
    private String userMarry;
    /**所在城市*/
    private String userCity;
    /**用户现状
     * 两种状态：在职、离职*/
    private String userState;
    /**目标职位*/
    private String userTarget;
    /**所属行业*/
    private String userIndustry;
    /**用户兴趣爱好*/
    private String userHobby;
    /**用户的自我评价*/
    private String userSelfappraise;
    /**用户学历
     * 分类：专科、本科、硕士、博士*/
    private String userEducation;
    /**用户所属\毕业院校*/
    private String userAcademy;
    /**用户专业*/
    private String userSpecialty;
    /**用户总学习时间(小时数)*/
    private Integer userAllTime;
    /**用户每日学习时长*/
    private Integer userDateTime;
    /**头像图片相对路径*/
    private String userImg;
    /**头像图片绝对路径*/
    private String userRealimg;


    public Comment(int commentId, String commentUserId, String comments, String teacherAnswer, String userId, String phonenum, String userPwd, String userRealname, String userSex, Date userBirthday, String userNative, String userMarry, String userCity, String userState, String userTarget, String userIndustry, String userHobby, String userSelfappraise, String userEducation, String userAcademy, String userSpecialty, Integer userAllTime, Integer userDateTime, String userImg, String userRealimg) {
        this.commentId = commentId;
        this.commentUserId = commentUserId;
        this.comments = comments;
        this.teacherAnswer = teacherAnswer;
        this.userId = userId;
        this.phonenum = phonenum;
        this.userPwd = userPwd;
        this.userRealname = userRealname;
        this.userSex = userSex;
        this.userBirthday = userBirthday;
        this.userNative = userNative;
        this.userMarry = userMarry;
        this.userCity = userCity;
        this.userState = userState;
        this.userTarget = userTarget;
        this.userIndustry = userIndustry;
        this.userHobby = userHobby;
        this.userSelfappraise = userSelfappraise;
        this.userEducation = userEducation;
        this.userAcademy = userAcademy;
        this.userSpecialty = userSpecialty;
        this.userAllTime = userAllTime;
        this.userDateTime = userDateTime;
        this.userImg = userImg;
        this.userRealimg = userRealimg;
    }

    public Comment() {
    }
}
