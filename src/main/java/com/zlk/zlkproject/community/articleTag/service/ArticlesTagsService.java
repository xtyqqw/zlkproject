package com.zlk.zlkproject.community.articleTag.service;

import com.zlk.zlkproject.entity.Article;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * @program: ArticleTagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/10 20:42
 */
public interface ArticlesTagsService {

    Page<Article> listArticles(Integer tagId, Pageable pageable);
}
