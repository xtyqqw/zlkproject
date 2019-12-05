package com.zlk.zlkproject.user.aboutus.service.cxr;

import com.zlk.zlkproject.user.entity.AboutUs;

/**
 * @author 崔新睿
 * @data 2019/11/22 - 9:53
 */
public interface AboutUsService {
    /**
     * 根据ID查询单条数据
     * @param aboutusId
     * @return
     */
    public AboutUs selectAboutUsById(String aboutusId);
}
