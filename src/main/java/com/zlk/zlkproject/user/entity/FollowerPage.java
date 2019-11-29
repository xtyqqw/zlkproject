package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: FollowerPage
 * @description: 关注者流加载用实体类
 * @author: xty
 * @create: 2019/11/28 15:41
 **/
@Getter
@Setter
@ToString
public class FollowerPage {
    private String userId;
    private Integer page;
    private Integer limit;
    private Integer index;

    public FollowerPage() {
    }

    public FollowerPage(String userId, Integer page, Integer limit, Integer index) {
        this.userId = userId;
        this.page = page;
        this.limit = limit;
        this.index = index;
    }
}
