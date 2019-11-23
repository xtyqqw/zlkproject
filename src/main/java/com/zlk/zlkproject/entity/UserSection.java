package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @program: zlkproject
 * @description: 用户与小节学习关联类
 * @author: zyx
 * @create: 2019-11-22 15:25
 */
@Getter
@Setter
public class UserSection {

    /**用户id*/
    private Integer userId;
    /**课程小节id*/
    private Integer sectionId;
    /**用户当前小节课程学习状态*/
    private String state;
    /**当前小节学习时长*/
    private Integer time;

    public UserSection() {
    }

    public UserSection(Integer userId, Integer sectionId, String state, Integer time) {
        this.userId = userId;
        this.sectionId = sectionId;
        this.state = state;
        this.time = time;
    }
}
