package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: Friends
 * @description: 友情链接实体类
 * @author: xty
 * @create: 2019/11/27 10:11
 **/
@Getter
@Setter
@ToString
public class Friends {
    private Integer id;
    private String url;
    private String name;

    public Friends(Integer id, String url, String name) {
        this.id = id;
        this.url = url;
        this.name = name;
    }

    public Friends() {
    }
}
