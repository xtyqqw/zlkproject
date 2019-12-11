package com.zlk.zlkproject.community.articleTag.dao;

import com.zlk.zlkproject.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @program: ArticleTagRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/10 20:40
 */
public interface ArticlesTagsRepository extends JpaRepository<Article, String>, JpaSpecificationExecutor<Article> {
}
