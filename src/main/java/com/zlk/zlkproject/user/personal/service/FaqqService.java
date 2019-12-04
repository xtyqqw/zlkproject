package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.user.entity.MyQuestions;
import com.zlk.zlkproject.user.entity.MyResponse;

import java.util.List;

/**
 * @program: FaqqService
 * @description:
 * @author: xty
 * @create: 2019/12/3 15:55
 **/
public interface FaqqService {
    List findAll(String userId);

    List<MyQuestions> findQuestion(String userId);

    List<MyResponse> findResponse(String userId);

    Integer deleteResponse(Integer responseId);

    Integer updateResponse(MyResponse myResponse);
}
