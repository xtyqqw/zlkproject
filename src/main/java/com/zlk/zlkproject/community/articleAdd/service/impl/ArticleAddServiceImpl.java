package com.zlk.zlkproject.community.articleAdd.service.impl;

import com.zlk.zlkproject.community.articleAdd.mapper.ArticleAddMapper;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: ArticleAddServiceImpl
 * @description: 文章业务实现
 * @author: QianKeQin
 * @date: 2019/11/26 11:56
 */

@Service
public class ArticleAddServiceImpl implements ArticleAddService {

    @Autowired
    private ArticleAddMapper articleAddMapper;

    /*@Override
    @Transactional
    public Integer createArticle(Article article, List<Integer> tagId) {
        articleAddMapper.createArticle(article,tagId);
        String articleId=article.getArticleId();
        for (int k : tagId) {
            articleAddMapper.setArticleTags(articleId,k);
        }
        return Integer.valueOf(articleId);
    }*/

    @Override
    public Integer createArticle(Article article) {
        return articleAddMapper.createArticle(article);
    }

    @Override
    public void setArticleTags(String articleId, Integer tagId) {
        articleAddMapper.setArticleTags(articleId,tagId);
    }
}
