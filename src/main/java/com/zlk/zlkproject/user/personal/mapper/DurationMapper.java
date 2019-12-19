package com.zlk.zlkproject.user.personal.mapper;

import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface DurationMapper {

    /**
     * 查询每日和总学习时长
     * @param userId
     * @return
     */
    User selectDuration(String userId);

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

    /**
     * 技能水平
     * @param userId
     * @return
     */
    Integer findCourses(String userId);

    /**
     * 查询视频总数
     * @return
     */
    Integer selectSections();

    /**
     * 根据UserId查询用户已完成哪些视频
     * @param userId
     * @return
     */
    Integer selectSection(String userId);
}
