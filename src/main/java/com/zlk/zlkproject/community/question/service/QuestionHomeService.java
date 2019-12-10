package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionHomeService {   /*
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
