package com.zlk.zlkproject.community.articleTag.service;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;

import java.util.List;

/**
 * @program: ArticleTagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/22 15:32
 */
public interface ArticleByTagService {

    List<Article> findArticleByTag(Integer tagId,Pagination pagination);
}
