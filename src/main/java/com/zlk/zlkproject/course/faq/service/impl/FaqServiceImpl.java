package com.zlk.zlkproject.course.faq.service.impl;


import com.zlk.zlkproject.course.faq.mapper.FaqerMapper;
import com.zlk.zlkproject.course.faq.service.FaqService;
import com.zlk.zlkproject.entity.Faq;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName faqServiceImpl
 * @Description:
 * @Author LuanKe
 * Date 2019/11/25 14:42
 **/
@Service
public class FaqServiceImpl implements FaqService {
    @Autowired
    private FaqerMapper faqerMapper;
    @Override
    public List<Faq> findFaqerList(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return faqerMapper.findFaqerList(pagination);
    }

    @Override
    public Integer findFaqCount(Pagination pagination) {
        return faqerMapper.findFaqCount(pagination);
    }
}
