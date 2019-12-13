package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Response;
import org.springframework.stereotype.Service;

import java.util.List;


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
    /*
     * @descrption 查询全部回复
     * @author gby
     * @param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Response>
     * @date 2019/12/12 21:45
     */
    List<Response> findAll(Pagination pagination);
    /*
     * @descrption 按照最新发布日期排序（默认）
     * @author gby
     * @param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Response>
     * @date 2019/12/12 21:24
     */
    List<Response> findByResponseTime(Pagination pagination);



}
