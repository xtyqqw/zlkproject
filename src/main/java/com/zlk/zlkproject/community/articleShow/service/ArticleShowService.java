package com.zlk.zlkproject.community.articleShow.service;

import com.zlk.zlkproject.entity.Article;

/**
 * @program: ArticleShowService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 12:23
 */
public interface ArticleShowService {

    /**
     * @description: 查询文章详情
     * @param articleId
     * @return: com.zlk.zlkproject.entity.Article
     * @author: QianKeQin
     * @date: 2019/12/6 19:21
     */
    Article getArticle(String articleId);

    /**
     * @description: 查询文章详情并转换格式
     * @param articleId
     * @return: com.zlk.zlkproject.entity.Article
     * @author: QianKeQin
     * @date: 2019/12/6 19:22
     */
    Article getAndConvert(String articleId);
}
