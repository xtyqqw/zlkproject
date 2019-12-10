package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.user.entity.Articles;
import com.zlk.zlkproject.user.entity.StuNote;
import com.zlk.zlkproject.user.personal.mapper.ArticlesMapper;
import com.zlk.zlkproject.user.personal.service.ArticlesService;
import com.zlk.zlkproject.user.until.LeaveTime;
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
    /**
     * 注入资源
     */
    @Autowired(required = false)
    private ArticlesMapper articlesMapper;

    /**
     * 根据userid查询user文章的集合
     * @param userId
     * @return
     */
    @Override
    public List<Articles> selectArticles(String userId){
        List<Articles> list = articlesMapper.selectArticles(userId);
        int s=list.size();
        for(int i=0;i<s;i++){
            Articles articles=list.get(i);
            articles.setCreateDate(LeaveTime.formatDate(articles.getCreateTime()));
            list.set(i,articles);
        }
        return list;
    }

    /**
     * 根据用户ID查询我的文章的数量
     * @param userId
     * @return
     */
    @Override
    public Integer findArticlesId(String userId){
        return articlesMapper.findArticlesId(userId);
    }

    /**
     * 修改我的文章
     * @param articles
     * @return
     */
    @Override
    public Integer updateArticles(Articles articles){
        return articlesMapper.updateArticles(articles);
    }

    /**
     * 删除我的文章
     * @param articleId
     * @return
     */
    @Override
    public Integer deleteArticles(String articleId){
        return articlesMapper.deleteArticles(articleId);
    }

    /**
     * 分页查询我的文章
     * @param pagination
     * @return
     */
    @Override
    public List<Articles> findArticlesAll(Pagination pagination){
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        List<Articles> list=articlesMapper.findArticlesAll(pagination);
        int a=list.size();
        for(int i=0;i<a;i++){
            Articles articles=list.get(i);
            articles.setCreateDate(LeaveTime.formatDate(articles.getCreateTime()));
            list.set(i,articles);
        }
        return list;
    }

    /**
     * 删除标签
     * @param articleId
     * @return
     */
    @Override
    public Integer updateTag(String articleId){

        return articlesMapper.updateTag(articleId);
    }

    /**
     * 添加标签
     * @param articleId
     * @return
     */
    @Override
    public List<Tag> insertTag(String articleId){
        return articlesMapper.insertTag(articleId);
    }

    @Override
    public Articles findArtById(String articleId) {
        return articlesMapper.findArtById(articleId);
    }
}
