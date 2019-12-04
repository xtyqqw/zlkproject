package com.zlk.zlkproject.community.articleShow.service;

import com.zlk.zlkproject.community.entity.Article;

/**
 * @program: ArticleShowService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 12:23
 */
public interface ArticleShowService {

    Article getArticle(String id);

    Article getAndConvert(String id);
}
