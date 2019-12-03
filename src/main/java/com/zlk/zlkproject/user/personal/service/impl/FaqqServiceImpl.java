package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.Faq;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.MyQuestions;
import com.zlk.zlkproject.user.personal.mapper.FaqqMapper;
import com.zlk.zlkproject.user.personal.service.FaqqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: FaqqServiceImpl
 * @description: 问答业务层
 * @author: xty
 * @create: 2019/12/3 15:56
 **/
@Service
public class FaqqServiceImpl implements FaqqService {
    @Autowired
    FaqqMapper faqqMapper;
    @Override
    public List<MyQuestions> findQuestion(String userId) {
        return faqqMapper.findQuestion(userId);
    }
}
