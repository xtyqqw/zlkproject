package com.zlk.zlkproject.community.articleHot.service.impl;

import com.zlk.zlkproject.community.articleHot.mapper.ArticleHotMapper;
import com.zlk.zlkproject.community.articleHot.service.ArticleHotService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleHotServiceImpl
 * @description:
 * @date 2019/11/19 20:17
 */
@Service
public class ArticleHotServiceImpl implements ArticleHotService {

    @Resource
    private ArticleHotMapper articleHotMapper;

    /**
     * 通过标题查询相对应的文章内容
     * @param article
     * @return
     */
    @Override
    public List<Article> selectTitleByArticle(Article article){
        return articleHotMapper.selectTitleByArticle(article);
    }

    /**
     * 通过浏览量查询文章标题
     * @param article
     * @return
     */
    @Override
    public List<Article> findTitleByBrowseCount(Article article) {
        return articleHotMapper.findTitleByBrowseCount(article);
    }

    /**
     * 查询所有文章内容
     * @param article
     * @return
     */
    @Override
    public List<Article> selectAll(Article article) {
        return articleHotMapper.selectAll(article);
    }

}
