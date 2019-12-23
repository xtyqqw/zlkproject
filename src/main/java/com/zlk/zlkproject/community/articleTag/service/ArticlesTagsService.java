package com.zlk.zlkproject.community.articleTag.service;

import com.zlk.zlkproject.entity.Article;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;


/**
 * @program: ArticleTagService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/10 20:42
 */
public interface ArticlesTagsService {

    /**
     * @description: 通过标签Id查询相应文章分页展示
     * @param tagId
     * @param pageable
     * @return: org.springframework.data.domain.Page<com.zlk.zlkproject.entity.Article>
     * @author: QianKeQin
     * @date: 2019/12/20 9:36
     */
    Page<Article> listArticles(Integer tagId, Pageable pageable);
}
