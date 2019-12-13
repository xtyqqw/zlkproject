package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionHomeMapper {
    /*
     * @descrption 查询总数
     * @author gby
     * @param
     * @return
     * @date 2019/12/13 0:31
     */
    Integer findQuestionCount(Pagination pagination);

    /*
     * @descrption 按照最新发布日期排序（默认）
     * @author gby
     * @param
     * @return
     * @date 2019/12/10 14:15
     */
    List<Question> findByQuestionTime(Pagination pagination);

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
