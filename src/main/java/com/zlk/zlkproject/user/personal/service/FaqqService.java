package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.user.entity.MyQuestions;

import java.util.List;

/**
 * @program: FaqqService
 * @description:
 * @author: xty
 * @create: 2019/12/3 15:55
 **/
public interface FaqqService {
    List<MyQuestions> findQuestion(String userId);
}
