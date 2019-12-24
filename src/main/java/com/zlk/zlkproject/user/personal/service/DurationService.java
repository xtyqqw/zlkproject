package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.entity.User;

import java.util.List;

public interface DurationService {
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
     * 查询用户参加的项目下所有视频的数量
     * @param userId
     * @return
     */
    Integer findSectionAll(String userId);

    /**
     * 查询已完成视频数量
     * @param userId
     * @return
     */
    Integer findWanCheng(String userId);
    /**
     * 查询项目下视频总数
     * @return
     */
    Integer selectAllTime(String userId);
    /**
     * 根据UserId查询用户已完成哪些视频
     * @param userId
     * @return
     */
    Integer selectSection(String userId);
}
