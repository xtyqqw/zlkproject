package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.entity.Article;

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
    List<Article> selectArticles(String userId);
}
