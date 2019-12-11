package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Response;
import org.springframework.stereotype.Service;

@Service
public interface ResponseService {
    /*
     * @descrption 新增回复
     * @author gby
     * @param [response]
     * @return com.zlk.zlkproject.entity.Response
     * @date 2019/12/11 16:36
     */
    Response save(Response response);


}
