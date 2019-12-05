package com.zlk.zlkproject.community.articleAdd.service;



import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.entity.Tag;

import java.util.List;

/**
 * @program: ArticleAddService
 * @description: 创建文章业务操作
 * @author: QianKeQin
 * @date: 2019/11/26 9:32
 */
public interface ArticleAddService {

    Article saveArticle(Article article);
}
