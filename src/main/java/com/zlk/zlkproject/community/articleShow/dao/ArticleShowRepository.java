package com.zlk.zlkproject.community.articleShow.dao;

import com.zlk.zlkproject.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


/**
 * @program: ArticleShowRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 12:39
 */
public interface ArticleShowRepository extends JpaRepository<Article, String>, JpaSpecificationExecutor<Article> {

    @Transactional
    @Modifying
    @Query("update Article a set a.browseCount = a.browseCount+1 where a.articleId = ?1")
    int updateBrowseCounts(String articleId);
}
