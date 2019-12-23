package com.zlk.zlkproject.community.articleAdd.service;

import com.zlk.zlkproject.entity.Article;

/**
 * @program: ArticleAddService
 * @description: 创建文章业务操作
 * @author: QianKeQin
 * @date: 2019/11/26 9:32
 */
public interface ArticleAddService {

    /**
     * @description: 保存文章
     * @param article
     * @return: com.zlk.zlkproject.entity.Article
     * @author: QianKeQin
     * @date: 2019/12/6 19:16
     */
    Article saveArticle(Article article);
}
