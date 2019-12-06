package com.zlk.zlkproject.community.articleManager.service.impl;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.community.articleManager.mapper.ArticleManagerMapper;
import com.zlk.zlkproject.community.articleManager.service.ArticleManagerService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 张照伟
 * @program: ArticleServiceImpl
 * @description:文章管理的Service实现类
 * @date 2019/11/27 9:07
 */
@Service
public class ArticleManagerServiceImpl implements ArticleManagerService {
    @Autowired
    private ArticleManagerMapper articleManagerMapperMapper;

    /**
     * 新增文章
     * @param article
     * @return
     */
    @Override
    public Integer addArticle(Article article) {
        return articleManagerMapperMapper.addArticle(article);
    }

    /**
     * 删除文章
     * @param articleId
     * @return
     */
    @Override
    public Integer deleteArticleByArticleId(String articleId) {
        return articleManagerMapperMapper.deleteArticleByArticleId(articleId);
    }

    /**
     * 修改文章
     * @param article
     * @return
     */
    @Override
    public Integer updateArticleByArticleId(Article article) {
        return articleManagerMapperMapper.updateArticleByArticleId(article);
    }

    /**
     * 通过标题查询文章内容
     * @param title
     * @return
     */
    @Override
    public List<Article> selectArticleByTitle(String title) {
        return articleManagerMapperMapper.selectArticleByTitle(title);
    }

    /**
     * 文章管理通过标题模糊查询返回数据数量
     * @param pagination
     * @return
     */
    @Override
    public Integer selectCountByTitle(Pagination pagination) {
        return articleManagerMapperMapper.selectCountByTitle(pagination);
    }

    /**
     * 根据文章id查询文章内容
     * @param articleId
     * @return
     */
    @Override
    public Article selectArticleByArticleId(String articleId) {
        return articleManagerMapperMapper.selectArticleByArticleId(articleId);
    }

    /**
     * 文章管理的分页查询
     * @param pagination
     * @return
     */
    @Override
    public List<Article> selectArticleByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return articleManagerMapperMapper.selectArticleByLimit(pagination);
    }
}
