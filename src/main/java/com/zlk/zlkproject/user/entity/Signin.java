package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName： Signin
 * @Description： 签到数据实体类
 * @Author： yzh
 * @Date： 2019/11/26 13:43
 */
@Setter
@Getter
@ToString
public class Signin {
    /**签到表ID*/
    private Integer signinId;
    /**userID*/
    private String signinUserId;
    /**上次签到时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd hh-mm-ss")
    private Date signinLastTime;
    /**签到次数*/
    private Integer signinNum;

    public Signin() {
    }

    public Signin(Integer signinId, String signinUserId, Date signinLastTime, Integer signinNum) {
        this.signinId = signinId;
        this.signinUserId = signinUserId;
        this.signinLastTime = signinLastTime;
        this.signinNum = signinNum;
    }
}
