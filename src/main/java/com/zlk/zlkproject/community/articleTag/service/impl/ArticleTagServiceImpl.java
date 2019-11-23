package com.zlk.zlkproject.community.articleTag.service.impl;

import com.zlk.zlkproject.community.articleTag.mapper.ArticleTagMapper;
import com.zlk.zlkproject.community.articleTag.service.ArticleTagService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ArticleTagServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 17:08
 */
@Service
public class ArticleTagServiceImpl implements ArticleTagService {

    @Autowired
    private ArticleTagMapper articleTagMapper;

    @Override
    public List<Article> getArticleByTagId(Integer tagId) {
        return articleTagMapper.getArticleByTagId(tagId);
    }
}
