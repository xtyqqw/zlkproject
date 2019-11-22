package com.zlk.zlkproject.community.articleTag.mapper;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: ArticleTagMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 15:37
 */

@Mapper
public interface ArticleTagMapper {

    List<Tag> getAllTagByTagId(Integer tagId);

    List<Article> getArticleByTagId(String articleId);
}
