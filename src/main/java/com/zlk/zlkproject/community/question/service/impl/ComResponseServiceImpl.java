package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.mapper.ComResponseMapper;
import com.zlk.zlkproject.community.question.service.ComResponseService;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gby
 * @ClassName ResponseServicrImpl
 * @description 社区问题回答
 * @date 2019/12/30 15:30
 */
@Service
public class ComResponseServiceImpl implements ComResponseService {
    @Autowired
    private ComResponseMapper comResponseMapper;
    @Override
    public Integer addResponse(Response response) {
        return comResponseMapper.addResponse(response);
    }

    @Override
    public Integer findResponseId(String questionId) {
        return comResponseMapper.findResponseId(questionId);
    }

    @Override
    public List<Response> findAllResponse(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return comResponseMapper.findAllResponse(pagination);
    }

}
