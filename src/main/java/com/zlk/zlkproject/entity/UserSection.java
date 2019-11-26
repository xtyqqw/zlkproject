package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: zlkproject
 * @description: UserSection实体类
 * @author: hry
 * @create: 2019/11/25 14:08
 **/
@Getter
@Setter
@ToString
public class UserSection {
    /**用户id 主键 对应字段user_id*/
    private Integer userId;
    /**小节id 主键 对应字段section_id*/
    private Integer sectionId;
    /**小节状态 对应字段state*/
    private Integer state;
    /**小节时间记录 对应字段time*/
    private Double time;

    public UserSection() {
    }

    public UserSection(Integer userId, Integer sectionId, Integer state, Double time) {
        this.userId = userId;
        this.sectionId = sectionId;
        this.state = state;
        this.time = time;
    }
}
