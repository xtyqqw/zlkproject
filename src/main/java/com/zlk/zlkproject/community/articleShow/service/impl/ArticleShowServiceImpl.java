package com.zlk.zlkproject.community.articleShow.service.impl;

import com.zlk.zlkproject.community.articleShow.dao.ArticleShowRepository;
import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.community.util.MarkdownUtils;
import javassist.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

/**
 * @program: ArticleShowServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 12:24
 */
@Service
public class ArticleShowServiceImpl implements ArticleShowService {

    @Autowired
    private ArticleShowRepository articleShowRepository;

    @Override
    public Article getArticle(String articleId) {
        Optional<Article> article=articleShowRepository.findById(articleId);
        return article.orElse(null);
    }

    @Transactional
    @Override
    public Article getAndConvert(String articleId) {
        Article article=articleShowRepository.findById(articleId).get();
        if (article == null) {
            try {
                throw new NotFoundException("该文章不存在");
            } catch (NotFoundException e) {
                e.printStackTrace();
            }
        }
        Article a=new Article();
        BeanUtils.copyProperties(article,a);
        String content=a.getArticleContent();
        a.setArticleContent(MarkdownUtils.markdownToHtmlExtensions(content));
        articleShowRepository.updateBrowseCounts(articleId);
        return a;
    }
}
