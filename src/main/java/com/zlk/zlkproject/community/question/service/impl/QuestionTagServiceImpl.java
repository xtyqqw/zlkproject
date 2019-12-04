package com.zlk.zlkproject.community.question.service.impl;

import com.sun.xml.bind.v2.runtime.unmarshaller.TagName;
import com.zlk.zlkproject.community.question.mapper.QuestionTagMapper;
import com.zlk.zlkproject.community.question.service.QuestionTagService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gby
 * @ClassName QuestionTagServiceImpl
 * @description
 * @date 2019/12/3 14:13
 */
@Service
public class QuestionTagServiceImpl implements QuestionTagService {
    @Autowired
    private QuestionTagMapper questionTagMapper;

    @Override
    public List<Tag> listTagAll() {
        return questionTagMapper.listTagAll();
    }
}
