package com.zlk.zlkproject.user.aboutus.service.cxr;

import com.zlk.zlkproject.user.entity.Contactus;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 20:42
 */
public interface ContactusService {
    /**
     * 根据ID查询单个对象
     * @param contactusId
     * @return
     */
    public Contactus secletContactusById(String contactusId);
}
