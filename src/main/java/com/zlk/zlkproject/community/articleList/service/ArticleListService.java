package com.zlk.zlkproject.community.articleList.service;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import org.apache.ibatis.annotations.Param;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

/**
 * @program:ArticleListService
 * @description:
 * @author:zj
 * @date:2019/11/19 10:33
 */
public interface ArticleListService {
    /**查询总数*/
    Integer findArticleCount(Pagination pagination);
    /**倒序查询最新（默认）*/
    List<Article> findByCreateTime(Pagination pagination);
    /**倒序查询热门（浏览次数）*/
    List<Article> findByBrowseCount(Pagination pagination);
    /**查询我的文章*/
    List<Article> findByUserId(Pagination pagination);
    /**查询我的文章个数*/
    Integer findArticleId(String userId);
}
