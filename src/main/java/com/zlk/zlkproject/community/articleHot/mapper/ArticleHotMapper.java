package com.zlk.zlkproject.community.articleHot.mapper;

import com.zlk.zlkproject.entity.Article;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleHotMapper
 * @description:
 * @date 2019/11/19 17:27
 */
@Mapper
public interface ArticleHotMapper {
    /**
     * 根据文章标题倒序返回热门文章标题
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
    List<Article> selectAll(Article article);

}
