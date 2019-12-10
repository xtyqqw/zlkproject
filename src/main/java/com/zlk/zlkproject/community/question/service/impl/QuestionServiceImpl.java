package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.QuestionMapper;
import com.zlk.zlkproject.community.question.service.QuestionService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
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
    public Integer selectUserId(User user) {
        return questionMapper.selectUserId(user);
    }

    @Override
    public Integer selectCheck(String userId) {
        return questionMapper.selectCheck(userId);
    }

    @Transactional
    @Override
    public Integer addQuestion(Question question) {
        User user = new User();
        question.setQuestionId(UUIDUtils.getId());
        question.setCreateTime(new Date());
        //发布文章的动态的状态为1
        question.setSolve(0);
        question.setQuestionId(question.getQuestionId());

        return questionMapper.addQuestion(question);
    }
}
