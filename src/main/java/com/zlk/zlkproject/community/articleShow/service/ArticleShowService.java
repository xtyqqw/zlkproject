package com.zlk.zlkproject.community.articleShow.service;

import com.zlk.zlkproject.entity.Article;

/**
 * @program: ArticleShowService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 12:23
 */
public interface ArticleShowService {

    Article getArticle(String articleId);

    Article getAndConvert(String articleId);
}
