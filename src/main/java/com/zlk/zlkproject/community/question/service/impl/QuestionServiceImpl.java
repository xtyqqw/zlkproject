package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.QuestionMapper;
import com.zlk.zlkproject.community.question.mapper.QuestionTagMapper;
import com.zlk.zlkproject.community.question.mapper.QuestionTypeMapper;
import com.zlk.zlkproject.community.question.service.QuestionService;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

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
    public Integer addQuestion( String questionTitle, String questionContent, Date createTime, String typeName, String tagName) {
        return questionMapper.addQuestion(questionTitle,questionContent,createTime,typeName,tagName);
    }
}
