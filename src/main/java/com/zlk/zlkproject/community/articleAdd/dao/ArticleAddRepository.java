package com.zlk.zlkproject.community.articleAdd.dao;

import com.zlk.zlkproject.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

/**
 * @program: ArticleAddRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/3 13:33
 */
public interface ArticleAddRepository extends JpaRepository<Article, String>, JpaSpecificationExecutor<Article> {

    @Transactional
    @Query(value="select a.user_id,a.approval,u.user_id from article a , user u where a.user_id=u.user_id", nativeQuery=true)
    Article findArticleByApprovalIsTrue(Integer approval);
}
