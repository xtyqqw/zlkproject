package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 17:45
 * 联系我们实体类
 */
@Getter
@Setter
public class Contactus {
    /*联系我们id*/
    private String contactusId;
    /*电子邮件*/
    private String contactusEmail;
    /*联系电话*/
    private String contactusPhone;
    /*工作时间*/
    private String contactusWorktime;
    /*客服提醒*/
    private String contactusRemind;
    /*联系地址*/
    private String contactusAddress;
    /*邮编*/
    private String contactusPostcode;
    /*微信*/
    private String contactusWeixin;
    //无参构造
    public Contactus(){

    }
    //有参构造
    public Contactus(String contactusId,String contactusEmail,String contactusPhone,
                     String contactusWorktime,String contactusRemind, String contactusAddress,
                     String contactusPostcode,String contactusWeixin){
        this.contactusId=contactusId;
        this.contactusEmail=contactusEmail;
        this.contactusPhone=contactusPhone;
        this.contactusWorktime=contactusWorktime;
        this.contactusRemind=contactusRemind;
        this.contactusAddress=contactusAddress;
        this.contactusPostcode=contactusPostcode;
        this.contactusWeixin=contactusWeixin;
    }



}
