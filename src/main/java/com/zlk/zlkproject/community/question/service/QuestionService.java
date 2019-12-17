package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Question;
import org.springframework.stereotype.Service;

@Service
public interface QuestionService {

    /*
     * @descrption 新增提问
     * @author gby
     * @param [question]
     * @return com.zlk.zlkproject.entity.Question
     * @date 2019/12/17 0:35
     */
    Question saveQuestion(Question question);
}
