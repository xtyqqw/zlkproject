package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.dao.ResponseDao;
import com.zlk.zlkproject.community.question.mapper.ResponseMapper;
import com.zlk.zlkproject.community.question.service.ResponseService;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author gby
 * @ClassName ResponseServiceImpl
 * @description 回答
 * @date 2019/12/11 16:34
 */
@Service
public class ResponseServiceImpl implements ResponseService {
    @Autowired
    private ResponseDao responseDao;
    @Autowired
    private ResponseMapper responseMapper;

    @Override
    public Response findResponseById(String questionId) {
        return responseMapper.findResponseById(questionId);
    }

    @Override
    public Response save(Response response) {
        return responseDao.save(response);
    }

    @Override
    public List<Response> findAll(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return responseMapper.findAll(pagination);
    }

    @Override
    public List<Response> findByResponseTime(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return responseMapper.findByResponseTime(pagination);
    }

}
