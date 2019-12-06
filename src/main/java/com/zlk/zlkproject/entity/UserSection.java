package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


/**
 * @program: zlkproject
 * @description: 用户与小节学习关联类
 * @author: zyx
 * @create: 2019-11-22 15:25
 */
@Getter
@Setter
@ToString
public class UserSection {

    /**用户id 主键 对应字段user_id*/
    private String userId;
    /**小节id 主键 对应字段section_id*/
    private Integer sectionId;
    /**小节状态 对应字段state*/
    private Integer state;
    /**小节时间记录 对应字段time*/
    private Double time;

    public UserSection() {
    }

    public UserSection(String userId, Integer sectionId, Integer state, Double time) {
        this.userId = userId;
        this.sectionId = sectionId;
        this.state = state;
        this.time = time;
    }
}
