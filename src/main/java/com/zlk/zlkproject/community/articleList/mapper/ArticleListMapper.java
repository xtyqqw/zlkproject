package com.zlk.zlkproject.community.articleList.mapper;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * @program:ArticleListMapper
 * @description:
 * @author:zj
 * @date:2019/11/19 10:29
 */
@Mapper
public interface ArticleListMapper {
    /**显示分页*/
    List<Article> findArticleList(Pagination pagination);
    Integer findArticleCount(Pagination pagination);
    /**查询最新发布日期（默认）*/
    List<Article> findByCreateTime(Pagination pagination);
    /**查询最高浏览量（浏览次数）*/
    List<Article> findByBrowseCount(Pagination pagination);
    /**查询我的文章*/
    List<Article> findByUserId(Pagination pagination);
}
