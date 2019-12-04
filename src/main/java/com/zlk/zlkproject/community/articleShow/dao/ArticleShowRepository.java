package com.zlk.zlkproject.community.articleShow.dao;

import com.zlk.zlkproject.community.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @program: ArticleShowRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 12:39
 */
public interface ArticleShowRepository extends JpaRepository<Article, Long>, JpaSpecificationExecutor<Article> {

}
