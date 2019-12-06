package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionHomeService {   /*
    /*
     * @descrption 根据最新时间查询排序所有的问题
     * @author gby
     * @param
     * @return
     * @date 2019/12/6 16:02
     */
    List<Question> findQuestionByTime(String createTime);

    /*
     * @descrption 通过用户id查询问题
     * @author gby
     * @param [userId]
     * @return java.util.List<com.zlk.zlkproject.entity.Question>
     * @date 2019/12/6 16:50
     */
    Question findQuestionById(String userId);

    /*
     * @descrption 通过用户id查询用户信息
     * @author gby
     * @param [userId]
     * @return java.util.List<com.zlk.zlkproject.entity.User>
     * @date 2019/12/6 16:00
     */
    Integer findUserById(String userId);

}
