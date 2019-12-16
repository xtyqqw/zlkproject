package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Question;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionHomeService {
    /*
     * @descrption 查询总数
     * @author gby
     * @param
     * @return
     * @date 2019/12/13 0:31
     */
    Integer findQuestionCount(Pagination pagination);
    /*
     * @descrption 查询全部问题，按照最新发布日期排序（默认）
     * @author gby
     * @param
     * @return
     * @date 2019/12/10 14:15
     */
    List<Question> findAll(Pagination pagination);


    /*
     * @descrption 按照用户id查找问题，按最新发布日期排序（默认）
     * @author gby
     * @param
     * @return
     * @date 2019/12/10 14:15
     */
    List<Question> findByUserId(Pagination pagination,String userId);

    /*
     * @descrption 查询问答详情转换格式
     * @author gby
     * @param [questionId]
     * @return java.lang.Integer
     * @date 2019/12/10 9:16
     */
    Question getAndConvert(String questionId);
}
