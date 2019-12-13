package com.zlk.zlkproject.user.aboutus.mapper.cxr;

import com.zlk.zlkproject.user.entity.Opinion;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 11:59
 * 意见反馈方法
 */
@Mapper
public interface OpinionMapper {
    /**
     * 新增意见反馈方法
     * @return
     */
    public int addOpinion(Opinion opinion);

    /**
     * 游客新增意见方法
     * @param opinion
     * @return
     */
    public int insertOpinion(Opinion opinion);
}
