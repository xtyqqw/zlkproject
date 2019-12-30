package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: zlkproject
 * @description: 练习题实体类
 * @author: zyx
 * @create: 2019-12-20 10:41
 */
@Setter
@Getter
@ToString
public class Exercises {

    /** 练习题id 对应数据库字段 e_id*/
    private Integer eId;
    /** 对应小节id 对应数据库字段 section_id*/
    private Integer sectionId;
    /** 题型 对应数据库字段 type*/
    private String type;
    /** 练习题序号 对应数据库字段 exercise_num*/
    private Integer exerciseNum;
    /** 题目内容 对应数据库字段 title*/
    private String title;
    /** 备选答案A 对应数据库字段 answer_A*/
    private String answerA;
    /** 备选答案B 对应数据库字段 answer_B*/
    private String answerB;
    /** 备选答案C 对应数据库字段 answer_C*/
    private String answerC;
    /** 备选答案D 对应数据库字段 answer_D*/
    private String answerD;
    /** 正确答案 对应数据库字段 truth*/
    private String truth;
    /** 用户Id 对应数据库字段 user_id*/
    private String userId;
    /** 用户回答 对应数据库字段 answer*/
    private String userAnswer;
    /** 练习题原序号*/
    private Integer exerciseLastNum;

    public Exercises() {
    }

    public Exercises(Integer eId, Integer sectionId, String type, Integer exerciseNum, String title, String answerA, String answerB, String answerC, String answerD, String truth, String userId, String userAnswer) {
        this.eId = eId;
        this.sectionId = sectionId;
        this.type = type;
        this.exerciseNum = exerciseNum;
        this.title = title;
        this.answerA = answerA;
        this.answerB = answerB;
        this.answerC = answerC;
        this.answerD = answerD;
        this.truth = truth;
        this.userId = userId;
        this.userAnswer = userAnswer;
    }
}
