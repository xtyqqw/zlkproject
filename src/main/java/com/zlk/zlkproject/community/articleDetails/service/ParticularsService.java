package com.zlk.zlkproject.community.articleDetails.service;

import com.zlk.zlkproject.entity.Article;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface ParticularsService {

    /*
     * @descrption 根据id查询文章
     * @author gby
     * @param [articleId]
     * @return com.zlk.zlkproject.entity.Article
     * @date 2019/11/21 20:05
     */
    Article findById(@Param("articleId") String articleId);
}
