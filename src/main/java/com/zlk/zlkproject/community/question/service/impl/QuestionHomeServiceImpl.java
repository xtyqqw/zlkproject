package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.QuestionHomeMapper;
import com.zlk.zlkproject.community.question.service.QuestionHomeService;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gby
 * @ClassName QuestionHomeServiceImpl
 * @description 问答首页业务类
 * @date 2019/12/6 15:54
 */
@Service
public class QuestionHomeServiceImpl implements QuestionHomeService {
    @Autowired
    private QuestionHomeMapper questionHomeMapper;

    @Override
    public List<Question> findQuestionByTime(String createTime) {
        return questionHomeMapper.findQuestionByTime(createTime);
    }

    @Override
    public Question findByQuestionId(String questionId) {
        return questionHomeMapper.findByQuestionId(questionId);
    }


}
