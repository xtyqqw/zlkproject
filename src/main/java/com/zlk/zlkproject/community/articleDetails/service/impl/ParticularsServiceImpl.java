package com.zlk.zlkproject.community.articleDetails.service.impl;


import com.zlk.zlkproject.community.articleDetails.mapper.ParticularsMapper;
import com.zlk.zlkproject.community.articleDetails.service.ParticularsService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author gby
 * @ClassName particularsServiceImpl
 * @description 通过文章详情
 * @date 2019/11/21 20:18
 */
@Service
public class ParticularsServiceImpl implements ParticularsService {
    @Autowired
    private ParticularsMapper particularsMapper;

    @Override
    public Integer addArticleContent(String title,String articleId,String articleContent) {
        return particularsMapper.addArticleContent(title,articleId,articleContent);
    }

    @Override
    public Article findById(String articleId) {
        return particularsMapper.findById(articleId);
    }



}
