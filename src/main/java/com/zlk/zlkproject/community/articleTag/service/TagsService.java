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

    List<Tag> getAllTagByTagId(Tag tag);
}
