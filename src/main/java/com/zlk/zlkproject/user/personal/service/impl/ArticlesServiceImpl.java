package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.user.personal.mapper.ArticlesMapper;
import com.zlk.zlkproject.user.personal.service.ArticlesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName： ArticlesServiceImpl
 * @Description： 查询文章业务逻辑
 * @Author： sd
 * @Date： 2019/11/23 10:06
 */
@Service
public class ArticlesServiceImpl implements ArticlesService {
    @Autowired(required = false)
    private ArticlesMapper articlesMapper;
    @Override
    public List<Article> selectArticles(){

        return articlesMapper.selectArticles();
    }
}
