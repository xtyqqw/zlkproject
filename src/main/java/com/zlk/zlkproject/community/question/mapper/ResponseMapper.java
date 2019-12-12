package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Response;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ResponseMapper {
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
