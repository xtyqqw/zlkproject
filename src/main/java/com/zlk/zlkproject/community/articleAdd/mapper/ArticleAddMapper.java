package com.zlk.zlkproject.community.articleAdd.mapper;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.user.entity.Action;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;


/**
 * @program: ArticleAddMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/26 10:11
 */
@Mapper
public interface ArticleAddMapper {

    Integer createArticle(Article article);

    Integer setArticleTags(@Param(value = "articleId") String articleId, @Param(value = "tagId") Integer tagId);

    Integer addArticleToCommunityAction(Action action);

    List<Article> getAddArticleOfApproval(Action action);

    List<Tag> getTagsToAddArticle(Tag tag);
}
