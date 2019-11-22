package com.zlk.zlkproject.user.index.service;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.User;

import java.util.List;

/**
 * index service接口
 * @author yzh
 */
public interface IndexService {
    /**
     * 查询所有课程
     * @return List<Courses>
     */
    List<Courses> findCoursesAll();
    /**
     * 按照学习总时长从多到少查询用户
     * @return List<User>
     */
    List<User> findUsersByAllTime();
    /**
     * 根据ID查询用户
     * @param userId
     * @return User
     */
    User findUsersById(String userId);
    /**
     * 根据ID查询学习时长排序后用户的排名
     * @param userId
     * @return Integer
     */
    Integer findUserRankById(String userId);
}
