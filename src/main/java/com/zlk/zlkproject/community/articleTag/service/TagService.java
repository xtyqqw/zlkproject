package com.zlk.zlkproject.community.articleTag.service;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;

import java.util.List;

/**
 * @program: TagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 16:45
 */
public interface TagService {

    List<Tag> getAllTagByTagId(Integer tagId);
}
