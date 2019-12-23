package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Question;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionManagerService {
    /**
     * 根据问题标题模糊查询,查询问题总数
     * @param pagination
     * @return
     */
    Integer findCountByTitle(Pagination pagination);

    /**
     * 分页查询问题
     * @param pagination
     * @return
     */
    List<Question> findQuestionByLimit(Pagination pagination);
    /**
     * 根据问题id查询问题内容
     * @param questionId
     * @return
     */
    Question findById(String questionId);
}
