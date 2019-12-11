package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Question;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionHomeService {
    /*
     * @descrption 据ID查询问答个数
     * @author gby
     * @param []
     * @return java.lang.Integer
     * @date 2019/12/11 22:18
     */
    Integer findNumById(Question question);
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
    Question getQuestion(String questionId);
    /*
     * @descrption 查询问答详情转换格式
     * @author gby
     * @param [questionId]
     * @return java.lang.Integer
     * @date 2019/12/10 9:16
     */
    Question getAndConvert(String questionId);
}
