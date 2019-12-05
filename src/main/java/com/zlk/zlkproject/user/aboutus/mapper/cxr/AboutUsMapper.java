package com.zlk.zlkproject.user.aboutus.mapper.cxr;

import com.zlk.zlkproject.user.entity.AboutUs;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 崔新睿
 * @data 2019/11/22 - 9:34
 * 关于我们首页方法
 */
@Mapper
public interface AboutUsMapper {
    /**
     * 根据ID查询单条数据
     * @param aboutusId
     * @return
     */
    public AboutUs selectAboutUsById(String aboutusId);

}
