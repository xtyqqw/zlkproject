package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.user.entity.Articles;

import java.util.List;

/**
 * @ClassName： ArticlesService
 * @Description： Service接口
 * @Author： sd
 * @Date： 2019/11/23 10:02
 */
public interface ArticlesService {
    /**
     * 根据userid查询user文章的集合
     * @param userId
     * @return
     */
    List<Articles> selectArticles(String userId);

    /**
     * 根据用户ID查询我的文章的数量
     * @param userId
     * @return
     */
    Integer findArticlesId(String userId);

    /**
     * 修改我的文章
     * @param articles
     * @return
     */
    Integer updateArticles(Articles articles);

    /**
     * 删除我的文章
     * @param articleId
     * @return
     */
    Integer deleteArticles(String articleId);

    /**
     * 分页查询我的文章
     * @param pagination
     * @return
     */
    List<Articles> findArticlesAll(Pagination pagination);

    /**
     * 插入标签
     *
     * @param articleId
     * @return
     */
    Integer updateTag(String articleId);
    /**
     * 添加标签
     * @param articleId
     * @return
     */
    List<Tag> insertTag(String articleId);
}
