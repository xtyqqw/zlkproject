package com.zlk.zlkproject.course.faq.service;

import com.zlk.zlkproject.entity.Faq;
import com.zlk.zlkproject.entity.Pagination;

import java.util.List;

public interface FaqService {


    /**
     *@Author luanke
     *@Description //查询所有
     *@Date 19:25 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
     **/
    List<Faq> findFaqerList(Pagination pagination);

    Integer findFaqCount(Pagination pagination);
}
