package com.zlk.zlkproject.community.articleShow.service.impl;

import com.zlk.zlkproject.community.articleShow.dao.ArticleShowRepository;
import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.community.entity.Article;
import com.zlk.zlkproject.community.util.MarkdownUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public Article getArticle(Long id) {
        return articleShowRepository.findById(id).get();
    }

    @Override
    public Article getAndConvert(Long id) {
        Article article=articleShowRepository.findById(id).get();

        Article a=new Article();
        BeanUtils.copyProperties(article,a);
        String content=a.getArticleContent();
        a.setArticleContent(MarkdownUtils.markdownToHtmlExtensions(content));
        return a;
    }
}
