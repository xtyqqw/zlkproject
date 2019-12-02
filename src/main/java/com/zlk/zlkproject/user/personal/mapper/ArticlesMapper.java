package com.zlk.zlkproject.user.personal.mapper;


import com.zlk.zlkproject.entity.Article;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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
    List<Article> selectArticles(String userId);
}
