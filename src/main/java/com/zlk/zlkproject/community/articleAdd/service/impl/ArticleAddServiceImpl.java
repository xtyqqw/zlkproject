package com.zlk.zlkproject.community.articleAdd.service.impl;

import com.zlk.zlkproject.community.articleAdd.dao.ArticleAddRepository;
import com.zlk.zlkproject.community.articleAdd.mapper.ArticleAddMapper;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;

import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.entity.Tag;
import com.zlk.zlkproject.community.util.UUIDUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
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
    private ArticleAddRepository articleAddRepository;

    @Transactional
    @Override
    public Article saveArticle(Article article) {
        article.setId(UUIDUtils.getId());
        article.setCreateTime(new Date());
        article.setUpdateTime(new Date());
        article.setApproval(0);
        article.setArticleSetTop(1);
        return articleAddRepository.save(article);
    }

}
