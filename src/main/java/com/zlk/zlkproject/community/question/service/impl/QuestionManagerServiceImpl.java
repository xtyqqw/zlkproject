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
        return questionManagerMapper.findQuestionByLimit(pagination);
    }

    @Override
    public Question findById(String questionId) {
        return questionManagerMapper.findById(questionId);
    }
}
