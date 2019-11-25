package com.zlk.zlkproject.community.article.service.impl;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.community.article.mapper.ArticleMapper;
import com.zlk.zlkproject.community.article.service.ArticleService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleServiceImpl
 * @description:
 * @date 2019/11/23 9:07
 */
@Service
public class ArticleServiceImpl implements ArticleService {
    @Resource
    private ArticleMapper articleMapper;

    /**
     * 新增文章
     * @param article
     * @return
     */
    @Override
    public Integer addArticle(Article article) {
        return articleMapper.addArticle(article);
    }

    /**
     * 删除文章
     * @param articleId
     * @return
     */
    @Override
    public Integer deleteArticleByArticleId(String articleId) {
        return articleMapper.deleteArticleByArticleId(articleId);
    }

    /**
     * 修改文章
     * @param article
     * @return
     */
    @Override
    public Integer updateArticleByArticleId(Article article) {
        return articleMapper.updateArticleByArticleId(article);
    }

    /**
     * 通过标题查询文章内容
     * @param title
     * @return
     */
    @Override
    public Article selectArticleByTitle(String title) {
        return articleMapper.selectArticleByTitle(title);
    }

    /**
     * 通过标题模糊查询返回数据数量
     * @param pagination
     * @return
     */
    @Override
    public Integer selectCountByTitle(Pagination pagination) {
        return articleMapper.selectCountByTitle(pagination);
    }

    /**
     * 根据文章id查询文章内容
     * @param articleId
     * @return
     */
    @Override
    public Article selectArticleByArticleId(String articleId) {
        return articleMapper.selectArticleByArticleId(articleId);
    }

    @Override
    public List<Article> selectArticleByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return articleMapper.selectArticleByLimit(pagination);
    }
}
