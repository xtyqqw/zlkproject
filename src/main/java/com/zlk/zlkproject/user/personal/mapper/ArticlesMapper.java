package com.zlk.zlkproject.user.personal.mapper;


import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.user.entity.Articles;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.SplittableRandom;

/**
 * @ClassName： ArticlesMapper
 * @Description： 文章方法接口
 * @Author： sd
 * @Date： 2019/11/22 17:09
 */
@Mapper
public interface ArticlesMapper {
    /**
     * 根据userId查询user文章的集合
     * @param userId
     * @return
     */
    List<Articles> selectArticles(String userId);

    /**
     * 查询文章个数
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
     * 根据Id删除我的文章
     * @param articleId
     * @return
     */
    Integer deleteArticles(String articleId);

    /**
     * 流加载查询我的文章
     * @param pagination
     * @return
     */
    List<Articles> findArticlesAll(Pagination pagination);

    /**
     * 删除标签
     * @param articleId
     *
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
