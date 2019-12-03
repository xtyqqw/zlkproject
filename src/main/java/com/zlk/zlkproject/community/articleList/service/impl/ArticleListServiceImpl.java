package com.zlk.zlkproject.community.articleList.service.impl;

import com.zlk.zlkproject.community.articleList.mapper.ArticleListMapper;
import com.zlk.zlkproject.community.articleList.service.ArticleListService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program:AarticleListServiceImpl
 * @description:
 * @author:zj
 * @date:2019/11/19 10:34
 */
@Service
public class ArticleListServiceImpl implements ArticleListService {
    @Autowired
    private ArticleListMapper articleListMapper;
    @Override
    public List<Article> findArticleList(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return articleListMapper.findArticleList(pagination);
    }

    @Override
    public Integer findArticleCount(Pagination pagination) {
        return articleListMapper.findArticleCount(pagination);
    }

    @Override
    public List<Article> findByCreateTime() {
        return articleListMapper.findByCreateTime();
    }

    @Override
    public List<Article> findByBrowseCount() {
        return articleListMapper.findByBrowseCount();
    }

    @Override
    public List<Article> findByUserId(String userId,Integer page,Integer limit) {
        /*page=1;
        limit=5;*/
        Integer startPage = (page-1)*limit;
        return articleListMapper.findByUserId(userId,startPage,limit);
    }

}
