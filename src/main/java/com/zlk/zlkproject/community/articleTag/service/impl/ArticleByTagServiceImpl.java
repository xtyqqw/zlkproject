package com.zlk.zlkproject.community.articleTag.service.impl;

import com.zlk.zlkproject.community.articleTag.mapper.ArticleByTagMapper;
import com.zlk.zlkproject.community.articleTag.service.ArticleByTagService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ArticleByTagServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/9 13:30
 */
@Service
public class ArticleByTagServiceImpl implements ArticleByTagService {

    @Autowired
    private ArticleByTagMapper articleByTagMapper;

    @Override
    public List<Article> findArticleByTag(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        System.out.println("startPage = "+startPage);
        return articleByTagMapper.findArticleByTag(pagination);
    }

}
