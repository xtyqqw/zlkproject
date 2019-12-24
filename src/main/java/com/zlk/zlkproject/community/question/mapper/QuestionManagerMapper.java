package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Question;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QuestionManagerMapper {
    /*
     * @descrption 根据标题查询问题总数
     * @author gby
     * @param [pagination]
     * @return java.lang.Integer
     * @date 2019/12/23 19:14
     */
    Integer findCountByTitle(Pagination pagination);

    /*
     * @descrption 分页查询问题
     * @author gby
     * @param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Question>
     * @date 2019/12/23 19:14
     */
    List<Question> findQuestionByLimit(Pagination pagination);
    /*
     * @descrption 根据id查询问题
     * @author gby
     * @param [questionId]
     * @return com.zlk.zlkproject.entity.Question
     * @date 2019/12/23 19:13
     */
    Question findById(String questionId);

    /*
     * @descrption 根据id删除问题
     * @author gby
     * @param [questionId]
     * @return java.lang.Integer
     * @date 2019/12/23 19:14
     */
    Integer deleteById(String questionId);

    /*
     * @descrption 根据id批量删除问题
     * @author gby
     * @param [questionList]
     * @return java.lang.Integer
     * @date 2019/12/23 19:14
     */
    Integer deletesById(@Param("questionList") List<Question> questionList);

    /*
     * @descrption 修改问题信息
     * @author gby
     * @param
     * @return
     * @date 2019/12/23 21:45
     */
    Integer updateById(Question question);
}
