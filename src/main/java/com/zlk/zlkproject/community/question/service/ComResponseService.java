package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Response;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface ComResponseService {
    /*
     * @descrption 新增问题留言
     * @author gby
     * @param
     * @return
     * @date 2019/12/30 15:28
     */
    Integer addResponse(Response response);
    /*
     * @descrption 查询每个问题用户留言个数
     * @author gby
     * @param
     * @return
     * @date 2019/12/13 0:31
     */
    Integer findResponseId(String questionId);
    /*
     * @descrption 查询所有用户问题留言
     * @author gby
     * @param [response]
     * @return java.util.List<com.zlk.zlkproject.entity.Response>
     * @date 2019/12/31 10:06
     */
    List<Response> findAllResponse(Pagination pagination);

}
