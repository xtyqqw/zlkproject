package com.zlk.zlkproject.community.articleTag.service;

import com.zlk.zlkproject.entity.Tag;

import java.util.List;

/**
 * @program: TagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 16:45
 */
public interface TagsService {

    /**
     * @description: 通过类别Id查询所有类别
     * @param tag
     * @return: java.util.List<com.zlk.zlkproject.entity.Tag>
     * @author: QianKeQin
     * @date: 2019/11/23 11:13
     */
    List<Tag> getAllTagByTagId(Tag tag);
}
