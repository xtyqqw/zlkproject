package com.zlk.zlkproject.community.articleAdd.service;

import com.zlk.zlkproject.community.entity.Tag;

import java.util.List;

/**
 * @program: ArticleAddTagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/3 14:15
 */
public interface ArticleAddTagService {

    List<Tag> listTag();

    List<Tag> listTags(String ids);
}
