package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Question;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public interface QuestionService {
    /*
     * @descrption 提交提问
     * @author gby
     * @param [question]
     * @return com.zlk.zlkproject.entity.Question
     * @date 2019/12/3 11:44
     */
    Integer addQuestion(Question question);
}
