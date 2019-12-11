package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.QuestionMapper;
import com.zlk.zlkproject.community.question.service.QuestionService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;

/**
 * @author gby
 * @ClassName QuestionServiceImpl
 * @description 问答实现类
 * @date 2019/12/1 0:45
 */
@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    private QuestionMapper questionMapper;

    @Override
    public Integer selectUserId(Question qusetion) {
        return questionMapper.selectUserId(qusetion);
    }

    @Override
    public Integer selectCheck(String userId) {
        return questionMapper.selectCheck(userId);
    }

    @Transactional
    @Override
    public Integer addQuestion(Question question) {

        return questionMapper.addQuestion(question);
    }
}
