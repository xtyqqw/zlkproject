package com.zlk.zlkproject.user.personal.mapper;

import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DurationMapper {

    /**
     * 查询每日和总学习时长
     * @param user
     * @return
     */
    User selectDuration(User user);

    /**
     * 查询用户总数
     * @return
     */
    Integer findUser();

    /**
     * 根据查询排名
     * @param userId
     * @return
     */
    Integer findUserById(String userId);
}
