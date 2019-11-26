package com.zlk.zlkproject.user.entity;

import com.zlk.zlkproject.entity.Article;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName： Users
 * @Description： 用户类
 * @Author： sd
 * @Date： 2019/11/25 19:44
 */
public class Users {
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

    private List<Article> articleList=new ArrayList<>();
    public Users(String userId, String phonenum, String userPwd, String userRealname, String userSex, Date userBirthday, String userNative, String userMarry, String userCity, String userState, String userTarget, String userIndustry, String userHobby, String userSelfappraise, String userEducation, String userAcademy, String userSpecialty, Integer userAllTime, Integer userDateTime) {
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
    }

    public Users() {
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPhonenum() {
        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd;
    }

    public String getUserRealname() {
        return userRealname;
    }

    public void setUserRealname(String userRealname) {
        this.userRealname = userRealname;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserNative() {
        return userNative;
    }

    public void setUserNative(String userNative) {
        this.userNative = userNative;
    }

    public String getUserMarry() {
        return userMarry;
    }

    public void setUserMarry(String userMarry) {
        this.userMarry = userMarry;
    }

    public String getUserCity() {
        return userCity;
    }

    public void setUserCity(String userCity) {
        this.userCity = userCity;
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    public String getUserTarget() {
        return userTarget;
    }

    public void setUserTarget(String userTarget) {
        this.userTarget = userTarget;
    }

    public String getUserIndustry() {
        return userIndustry;
    }

    public void setUserIndustry(String userIndustry) {
        this.userIndustry = userIndustry;
    }

    public String getUserHobby() {
        return userHobby;
    }

    public void setUserHobby(String userHobby) {
        this.userHobby = userHobby;
    }

    public String getUserSelfappraise() {
        return userSelfappraise;
    }

    public void setUserSelfappraise(String userSelfappraise) {
        this.userSelfappraise = userSelfappraise;
    }

    public String getUserEducation() {
        return userEducation;
    }

    public void setUserEducation(String userEducation) {
        this.userEducation = userEducation;
    }

    public String getUserAcademy() {
        return userAcademy;
    }

    public void setUserAcademy(String userAcademy) {
        this.userAcademy = userAcademy;
    }

    public String getUserSpecialty() {
        return userSpecialty;
    }

    public void setUserSpecialty(String userSpecialty) {
        this.userSpecialty = userSpecialty;
    }

    public Integer getUserAllTime() {
        return userAllTime;
    }

    public void setUserAllTime(Integer userAllTime) {
        this.userAllTime = userAllTime;
    }

    public Integer getUserDateTime() {
        return userDateTime;
    }

    public void setUserDateTime(Integer userDateTime) {
        this.userDateTime = userDateTime;
    }

    public String getUserImg() {
        return userImg;
    }

    public void setUserImg(String userImg) {
        this.userImg = userImg;
    }

    public String getUserRealimg() {
        return userRealimg;
    }

    public void setUserRealimg(String userRealimg) {
        this.userRealimg = userRealimg;
    }

    public List<Article> getArticleList() {
        return articleList;
    }

    public void setArticleList(List<Article> articleList) {
        this.articleList = articleList;
    }
}
