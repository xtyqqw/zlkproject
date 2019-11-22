package com.zlk.zlkproject.community.articleDetails.service.impl;

import com.zlk.zlkproject.community.articleDetails.mapper.ArticleDetailsMapper;
import com.zlk.zlkproject.community.articleDetails.service.ArticleDetailsService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleDetailsServiceImpl
 * @description:
 * @date 2019/11/19 20:17
 */
@Service
public class ArticleDetailsServiceImpl implements ArticleDetailsService {

    @Resource
    private ArticleDetailsMapper articleDetailsMapper;

    /**
     * 通过标题查询相对应的文章内容
     * @param article
     * @return
     */
    @Override
    public List<Article> selectTitleByArticle(Article article){
        return articleDetailsMapper.selectTitleByArticle(article);
    }

    /**
     * 通过浏览量查询文章标题
     * @param article
     * @return
     */
    @Override
    public List<Article> findTitleByBrowseCount(Article article) {
        return articleDetailsMapper.findTitleByBrowseCount(article);
    }

    /**
     * 查询所有文章内容
     * @param article
     * @return
     */
    @Override
    public List<Article> selectAll(Article article) {
        return articleDetailsMapper.selectAll(article);
    }

}
