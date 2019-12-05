package com.zlk.zlkproject.user.aboutus.mapper.cxr;

import com.zlk.zlkproject.user.entity.Contactus;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 18:04
 */
@Mapper
public interface ContactusMapper {
    /**联系我们方法
     * 根据ID查询单个对象
     * @param contactusId
     * @return
     */
    public Contactus secletContactusById(String contactusId);
}
