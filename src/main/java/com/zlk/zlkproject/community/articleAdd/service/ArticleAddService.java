package com.zlk.zlkproject.community.articleAdd.service;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.user.entity.Action;

import java.util.List;

/**
 * @program: ArticleAddService
 * @description: 创建文章业务操作
 * @author: QianKeQin
 * @date: 2019/11/26 9:32
 */
public interface ArticleAddService {

    Integer createArticle(Article article);

    Integer setArticleTags(String articleId,Integer tagId);

    Integer addArticleToCommunityAction(Action action);

    List<Article> getAddArticleOfApproval(Action action);
}
