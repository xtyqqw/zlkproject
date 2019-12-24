package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.community.question.mapper.QuestionManagerMapper;
import com.zlk.zlkproject.community.question.service.QuestionManagerService;
import com.zlk.zlkproject.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gby
 * @ClassName questionManagerServiceImpl
 * @description 社区提问管理
 * @date 2019/12/23 15:51
 */
@Service
public class QuestionManagerServiceImpl implements QuestionManagerService {
    @Autowired
    private QuestionManagerMapper questionManagerMapper;


    @Override
    public Integer findCountByTitle(Pagination pagination) {
        return questionManagerMapper.findCountByTitle(pagination);
    }

    @Override
    public List<Question> findQuestionByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return questionManagerMapper.findQuestionByLimit(pagination);
    }

    @Override
    public Question findById(String questionId) {
        return questionManagerMapper.findById(questionId);
    }

    @Override
    public Integer deleteById(String questionId) {
        return questionManagerMapper.deleteById(questionId);
    }

    @Override
    public Integer deletesById(List<Question> questionList) {
        return questionManagerMapper.deletesById(questionList);
    }

    @Override
    public Integer updateById(Question question) {
        return questionManagerMapper.updateById(question);
    }

}
