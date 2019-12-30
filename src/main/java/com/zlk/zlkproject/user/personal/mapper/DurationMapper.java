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
     * 查询学习总时长
     * @return
     */
    Integer selectAllTime(String userId);

    /**
     * 根据UserId查询用户参与项目的所有视频总时间
     * @param userId
     * @return
     */
    Integer selectSection(String userId);
}
