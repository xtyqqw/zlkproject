package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Tag;

import java.util.List;

/**
 * @program: ArticleAddTagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/3 14:15
 */
public interface QuestionAddTagService {

    /**
     * @description: 发表提问页面标签下拉框查询所有标签
     * @return: java.util.List<com.zlk.zlkproject.entity.Tag>
     * @author: QianKeQin
     * @date: 2019/12/6 19:17
     */
    List<Tag> listTag();

    /**
     * @description: 一个问题下可以添加多个标签
     * @param ids
     * @return: java.util.List<com.zlk.zlkproject.entity.Tag>
     * @author: QianKeQin
     * @date: 2019/12/6 19:18
     */
    List<Tag> listTags(String ids);
}
