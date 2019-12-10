package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionHomeMapper {
    /*
     * @descrption 根据最新时间查询排序所有的问题
     * @author gby
     * @param
     * @return
     * @date 2019/12/7 18:58
     */
    List<Question> findQuestionByTime(String createTime);

    /*
     * @descrption 根据问题id查询文章
     * @author gby
     * @param [questionId]
     * @return com.zlk.zlkproject.entity.Question
     * @date 2019/12/7 18:56
     */
    Question findByQuestionId(@Param("questionId") String questionId);
    /*
     * @descrption 浏览量+1
     * @author gby
     * @param [questionId]
     * @return java.lang.Integer
     * @date 2019/12/10 9:16
     */
    Question editBrowseCount(String questionId);
}
