package com.zlk.zlkproject.community.article.service;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Article;

import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleService
 * @description:
 * @date 2019/11/22 18:01
 */
public interface ArticleService {
    /**
     * 新增文章
     * @param article
     * @return
     */
    Integer addArticle(Article article);
    /**
     * 根据文章id删除文章
     * @param articleId
     * @return
     */
    Integer deleteArticleByArticleId(String articleId);
    /**
     * 根据文章id修改文章内容
     * @param article
     * @return
     */
    Integer updateArticleByArticleId(Article article);
    /**
     * 根据文章标题查询文章内容
     * @param title
     * @return
     */
    Article selectArticleByTitle(String title);
    /**
     * 根据文章标题模糊查询
     * @param pagination
     * @return
     */
    Integer selectCountByTitle(Pagination pagination);
    /**
     * 根据文章id查询文章内容
     * @param articleId
     * @return
     */
    Article selectArticleByArticleId(String articleId);
    /**
     * 分页查询文章
     * @param pagination
     * @return
     */
    List<Article> selectArticleByLimit(Pagination pagination);
}
