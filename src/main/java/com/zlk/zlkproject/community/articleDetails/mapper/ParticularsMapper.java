package com.zlk.zlkproject.community.articleDetails.mapper;

import com.zlk.zlkproject.entity.Article;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ParticularsMapper {

    /*
     * @descrption
     * @author gby
     * @param 新增文章内容
     * @return
     * @date 2019/11/24 16:18
     */

    Integer addArticleContent(String title, String articleId, String articleContent);

    /*
     * @descrption 根据id查询文章
     * @author gby
     * @param [articleId]
     * @return com.zlk.zlkproject.entity.Article
     * @date 2019/11/21 20:05
     */
    Article findById(@Param("articleId") String articleId);

}
