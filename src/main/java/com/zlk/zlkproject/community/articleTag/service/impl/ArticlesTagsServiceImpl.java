package com.zlk.zlkproject.community.articleTag.service.impl;

import com.zlk.zlkproject.community.articleTag.dao.ArticlesTagsRepository;
import com.zlk.zlkproject.community.articleTag.service.ArticlesTagsService;
import com.zlk.zlkproject.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.*;

/**
 * @program: ArticlesTagsServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/10 20:45
 */

@Service
public class ArticlesTagsServiceImpl implements ArticlesTagsService {

    @Autowired
    private ArticlesTagsRepository articlesTagsRepository;

    @Override
    //Pageable是Spring Data库中定义的一个接口,用于构造分页查询
    public Page<Article> listArticles(Integer tagId, Pageable pageable) {
        return articlesTagsRepository.findAll(new Specification<Article>() {
            @Override
            //只需在方法的参数中直接定义一个pageable类型的参数,当Spring发现这个参数时,其会自动的根据request的参数来组装该pageable对象
            public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> cq, CriteriaBuilder cb) {
                Join join = root.join("tags");
                return cb.equal(join.get("tagId"),tagId);
            }
        },pageable);
    }
}
