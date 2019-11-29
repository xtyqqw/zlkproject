package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * (UserChapter)实体类
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/26 16:40
 */
@Setter
@Getter
public class UserChapter {

    /**
     * 用户id 对应数据库的 user_id 字段
     */
    private Integer userId;

    /**
     * 章节id 对应数据库的 chapter_id 字段
     */
    private Integer chapterId;

    public UserChapter(int userId, int chapterId) {
        this.userId = userId;
        this.chapterId = chapterId;
    }

    public UserChapter() {
    }
}
