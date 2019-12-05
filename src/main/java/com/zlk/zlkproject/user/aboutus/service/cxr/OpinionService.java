package com.zlk.zlkproject.user.aboutus.service.cxr;

import com.zlk.zlkproject.user.entity.Opinion;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 13:43
 */
public interface OpinionService {
    /**
     * 新增意见反馈方法
     * @return
     */
    public int addOpinion(Opinion opinion);
}
