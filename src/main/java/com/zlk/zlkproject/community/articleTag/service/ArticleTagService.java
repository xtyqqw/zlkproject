package com.zlk.zlkproject.community.articleTag.service;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;

import java.util.List;

/**
 * @program: ArticleTagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 15:32
 */
public interface ArticleTagService {

    /**
     * @description: 通过类别Id查询该类别下所有文章
     * @param tagId
     * @return: java.util.List<com.zlk.zlkproject.entity.Article>
     * @author: QianKeQin
     * @date: 2019/11/23 11:15
     */
    List<Article> getArticleByTagId(Integer tagId);
}
