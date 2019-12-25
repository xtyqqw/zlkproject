package com.zlk.zlkproject.community.articleManager.mapper;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleManagerMapper
 * @description:文章管理的映射类
 * @date 2019/11/27 14:22
 */
@Mapper
public interface ArticleManagerMapper {
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
     * 根据文章id批量删除文章
     * @param articleList
     * @return
     */
    Integer deleteArticlesByArticleId(@Param("articleList") List<Article> articleList);
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
    List<Article> selectArticleByTitle(String title);
    /**
     * 根据文章标题模糊查询,查询文章总数
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
     * 查询文章
     * @param article
     * @return
     */
    List<Article> findArticleToArticleEdit(Article article);
    /**
     * 分页查询文章
     * @param pagination
     * @return
     */
    List<Article> selectArticleByLimit(Pagination pagination);
}
