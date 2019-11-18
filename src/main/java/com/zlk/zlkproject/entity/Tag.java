package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: Tag
 * @description: 各个大项目中的小分类
 * @author: xty
 * @create: 2019/11/18 15:37
 **/
@Getter
@Setter
@ToString
public class Tag {
    /**tag对应id*/
    private Integer tagId;
    /**tag名称*/
    private String tagName;

    public Tag(Integer tagId, String tagName) {
        this.tagId = tagId;
        this.tagName = tagName;
    }

    public Tag() {
    }
}
