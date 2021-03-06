package com.zlk.zlkproject.user.entity;

public class Recruit {
    /*招聘信息人id*/
    private Integer recruitId;
    /*名字*/
    private String recruitName;
    /*学历*/
    private String recruitBac;
    /*身份证号码*/
    private String recruitNumber;
    /*手机号码*/
    private String recruitPhone;
    /*电子邮箱*/
    private String recruitMail;
    /*地址*/
    private String recruitSite;
    /*性别*/
    private String recruitSex;

    public Recruit(Integer recruitId, String recruitName, String recruitBac, String recruitNumber, String recruitPhone, String recruitMail, String recruitSite, String recruitSex) {
        this.recruitId = recruitId;
        this.recruitName = recruitName;
        this.recruitBac = recruitBac;
        this.recruitNumber = recruitNumber;
        this.recruitPhone = recruitPhone;
        this.recruitMail = recruitMail;
        this.recruitSite = recruitSite;
        this.recruitSex = recruitSex;
    }

    public Recruit() {
    }

    public Integer getRecruitId() {
        return recruitId;
    }

    public void setRecruitId(Integer recruitId) {
        this.recruitId = recruitId;
    }

    public String getRecruitName() {
        return recruitName;
    }

    public void setRecruitName(String recruitName) {
        this.recruitName = recruitName;
    }

    public String getRecruitBac() {
        return recruitBac;
    }

    public void setRecruitBac(String recruitBac) {
        this.recruitBac = recruitBac;
    }

    public String getRecruitNumber() {
        return recruitNumber;
    }

    public void setRecruitNumber(String recruitNumber) {
        this.recruitNumber = recruitNumber;
    }

    public String getRecruitPhone() {
        return recruitPhone;
    }

    public void setRecruitPhone(String recruitPhone) {
        this.recruitPhone = recruitPhone;
    }

    public String getRecruitMail() {
        return recruitMail;
    }

    public void setRecruitMail(String recruitMail) {
        this.recruitMail = recruitMail;
    }

    public String getRecruitSite() {
        return recruitSite;
    }

    public void setRecruitSite(String recruitSite) {
        this.recruitSite = recruitSite;
    }

    public String getRecruitSex() {
        return recruitSex;
    }

    public void setRecruitSex(String recruitSex) {
        this.recruitSex = recruitSex;
    }
}
