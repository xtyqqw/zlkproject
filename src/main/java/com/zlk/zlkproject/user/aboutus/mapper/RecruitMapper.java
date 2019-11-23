package com.zlk.zlkproject.user.aboutus.mapper;

import com.zlk.zlkproject.user.entity.Recruit;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RecruitMapper {
    /*添加招聘人信息*/
    Integer addRecruit(Recruit recruit);
}
