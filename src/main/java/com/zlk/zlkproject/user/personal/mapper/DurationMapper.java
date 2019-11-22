package com.zlk.zlkproject.user.personal.mapper;

import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DurationMapper {
    //查询每日和总学习时长
    User selectDuration(User user);
}
