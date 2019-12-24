package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.dao.QuestionDao;
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
    private QuestionDao questionDao;

    @Transactional
    @Override
    public Question saveQuestion(Question question) {
        question.setSolve("0");
        question.setZanCount(0);
        question.setCaiCount(0);
        question.setBrowseCount("0");
        question.setQuestionSetTop("1");
        question.setResponseCount(0);
        question.setAudit("0");
        return questionDao.save(question);
    }
}
