package com.zlk.zlkproject.community.articleAdd.mapper;

import com.zlk.zlkproject.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;


/**
 * @program: ArticleAddMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/26 10:11
 */
@Mapper
public interface ArticleAddMapper {

    Integer createArticle(Article article);

    void setArticleTags(@Param(value = "articleId") String articleId, @Param(value = "tagId") Integer tagId);
}
