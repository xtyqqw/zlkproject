package com.zlk.zlkproject.community.articleAdd.service.impl;

import com.zlk.zlkproject.community.articleAdd.mapper.ArticleAddMapper;
import com.zlk.zlkproject.community.articleAdd.service.ArticleAddService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.user.entity.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @program: ArticleAddServiceImpl
 * @description: 文章业务实现
 * @author: QianKeQin
 * @date: 2019/11/26 11:56
 */

@Service
public class ArticleAddServiceImpl implements ArticleAddService {

    @Autowired
    private ArticleAddMapper articleAddMapper;

    @Override
    public Integer createArticle(Article article) {
        return articleAddMapper.createArticle(article);
    }

    @Override
    public Integer setArticleTags(String articleId, Integer tagId) {
        return articleAddMapper.setArticleTags(articleId,tagId);
    }

    @Override
    public Integer addArticleToCommunityAction(Action action) {
        return articleAddMapper.addArticleToCommunityAction(action);
    }

    @Override
    public List<Article> getAddArticleOfApproval(Action action) {
        return null;
    }

    @Override
    public List<Tag> getTagsToAddArticle(Tag tag) {
        return articleAddMapper.getTagsToAddArticle(tag);
    }
}
