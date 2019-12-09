package com.zlk.zlkproject.community.articleTag.mapper;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: ArticleByTagMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/9 13:48
 */
@Mapper
public interface ArticleByTagMapper {

    List<Article> findArticleByTag(Integer tagId, Pagination pagination);
}
