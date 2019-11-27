package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/26 17:05
 */
@Setter
@Getter
public class UserSection {
    private Integer userId;

    private Integer sectionId;

    private String state;

    private Date time;

    public UserSection(int userId, int sectionId, String state, Date time ) {
        this.userId = userId;
        this.sectionId = sectionId;
        this.state = state;
        this.time = time;
    }

    public UserSection() {
    }
}
