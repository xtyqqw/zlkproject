package com.zlk.zlkproject.community.articleAdd.service;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;

import java.util.List;

/**
 * @program: ArticleAddService
 * @description: 文章业务操作
 * @author: QianKeQin
 * @date: 2019/11/26 9:32
 */
public interface ArticleAddService {

    Integer createArticle(Article article,List<Integer> tagId);
    void setArticleTags(String articleId,Integer tagId);
}
