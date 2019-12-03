package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.QuestionTypeMapper;
import com.zlk.zlkproject.community.question.service.QuestionTypeService;
import com.zlk.zlkproject.entity.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gby
 * @ClassName QuestionTypeServiceImpl
 * @description
 * @date 2019/12/3 14:15
 */
@Service
public class QuestionTypeServiceImpl implements QuestionTypeService {
    @Autowired
    private QuestionTypeMapper questionTypeMapper;


    @Override
    public List<Type> selectType(Type type) {
        return questionTypeMapper.selectType(type);
    }
}
