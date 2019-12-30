package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: zlkproject
 * @description: 用户回答实体类
 * @author: hry
 * @create: 2019-12-20 13:49
 */
@Setter
@Getter
@ToString
public class UserAnswer {
    /** 练习题id 对应数据库字段 ue_id*/
    private Integer ueId;
    /** 用户id 对应数据库字段 user_id*/
    private String userId;
    /** 小节id 对应数据库字段 section_id*/
    private Integer sectionId;
    /** 练习题序号 对应数据库字段 exercise_num*/
    private Integer exerciseNum;
    /** 用户回答 对应数据库字段 answer*/
    private String answer;

    public UserAnswer() {
    }

    public UserAnswer(Integer ueId, String userId, Integer sectionId, Integer exerciseNum, String answer) {
        this.ueId = ueId;
        this.userId = userId;
        this.sectionId = sectionId;
        this.exerciseNum = exerciseNum;
        this.answer = answer;
    }
}
