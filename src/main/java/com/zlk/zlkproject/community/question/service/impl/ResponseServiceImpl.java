package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.question.dao.ResponseDao;
import com.zlk.zlkproject.community.question.service.ResponseService;
import com.zlk.zlkproject.entity.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    @Override
    public Response save(Response response) {
        return responseDao.save(response);
    }
}
