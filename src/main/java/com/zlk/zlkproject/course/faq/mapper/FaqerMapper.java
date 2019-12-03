package com.zlk.zlkproject.course.faq.mapper;


import com.zlk.zlkproject.entity.Faq;
import com.zlk.zlkproject.entity.Pagination;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @ClassName faqMapper
 * @Description:
 * @Author LuanKe
 * Date 2019/11/25 14:41
 **/
@Mapper
@Component
public interface FaqerMapper {
    /**
     *@Author luanke
     *@Description //查询所有
     *@Date 19:16 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
     **/
    List<Faq> findFaqerList(Pagination pagination);

    Integer findFaqCount(Pagination pagination);
}
