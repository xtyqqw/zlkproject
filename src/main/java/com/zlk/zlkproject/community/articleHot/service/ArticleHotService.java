package com.zlk.zlkproject.community.articleHot.service;

import com.zlk.zlkproject.entity.Article;

import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleHotService
 * @description:
 * @date 2019/11/19 20:11
 */
public interface ArticleHotService {
    /**
     * 根据当月创建时间createTime降序查询热门文章标题
     * @param article
     * @return
     */
    List<Article> selectTitleByArticle(Article article);

    /**
     * 根据浏览量倒序返回文章标题
     * @param article
     * @return
     */
    List<Article> findTitleByBrowseCount(Article article);

    /**
     * 查询所有文章
     * @param article
     * @return
     */
    public List<Article> selectAll(Article article);
}
