package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.user.entity.Articles;
import com.zlk.zlkproject.user.personal.mapper.ArticlesMapper;
import com.zlk.zlkproject.user.personal.service.ArticlesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName： ArticlesServiceImpl
 * @Description： 查询文章业务逻辑
 * @Author： sd
 * @Date： 2019/11/23 10:06
 */
@Service
public class ArticlesServiceImpl implements ArticlesService {
    /**
     * 注入资源
     */
    @Autowired(required = false)
    private ArticlesMapper articlesMapper;

    /**
     * 根据userid查询user文章的集合
     * @param userId
     * @return
     */
    @Override
    public List<Articles> selectArticles(String userId){

        return articlesMapper.selectArticles(userId);
    }

    /**
     * 根据用户ID查询我的文章的数量
     * @param userId
     * @return
     */
    @Override
    public Integer findArticlesId(String userId){
        return articlesMapper.findArticlesId(userId);
    }

    /**
     * 修改我的文章
     * @param articles
     * @return
     */
    @Override
    public Integer updateArticles(Articles articles){
        return articlesMapper.updateArticles(articles);
    }

    /**
     * 删除我的文章
     * @param articleId
     * @return
     */
    @Override
    public Integer deleteArticles(String articleId){
        return articlesMapper.deleteArticles(articleId);
    }

    /**
     * 流加载
     * @param pagination
     * @return
     */
    @Override
    public List<Articles> findArticlesAll(Pagination pagination){
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return articlesMapper.findArticlesAll(pagination);
    }

    /**
     * 删除标签
     * @param articleId
     * @return
     */
    @Override
    public Integer updateTag(String articleId){

        return articlesMapper.updateTag(articleId);
    }

    /**
     * 添加标签
     * @param articleId
     * @return
     */
    @Override
    public List<Tag> insertTag(String articleId){
        return articlesMapper.insertTag(articleId);
    }
}