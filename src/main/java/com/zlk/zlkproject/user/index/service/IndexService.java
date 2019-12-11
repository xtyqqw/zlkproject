package com.zlk.zlkproject.user.index.service;

import com.zlk.zlkproject.entity.*;
import com.zlk.zlkproject.user.entity.Signin;

import java.util.Date;
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
     * 按照学习总时长从少到多查询用户
     * @return List<User>
     */
    List<User> findUsersByTime();
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
    /**
     * 查询用户总数
     * @return Integer
     */
    Integer findUserCount();
    /**
     *流加载查询分页课程
     * @param pagination
     * @return List<Courses>
     */
    List<Courses> findCoursesList(Pagination pagination);
    /**
     *查询所有方向
     * @return List<Type>
     */
    List<Type> findTypeAll();
    /**
     *根据方向ID查询包含类别
     * @param tagTypeId
     * @return List<Tag>
     */
    List<Tag> findTagsById(Integer tagTypeId);
    /**
     *根据方向ID查询课程
     * @param typeId
     * @return List<Courses>
     */
    List<Courses> findCoursesByTypeId(Integer typeId);
    /**
     *根据今天日期返回day
     * @param today
     * @return String
     */
    String findDayByDate(Date today);
    /**
     *根据用户ID查询上次签到日期
     * @param userId
     * @return String
     */
    String findDayByUserId(String userId);
    /**
     *根据用户ID查询连续签到次数
     * @param userId
     * @return Integer
     */
    Signin findSigninByUserId(String userId);
    /**
     *签到
     * @param signin
     * @return Integer
     */
    Integer signByUserId(Signin signin);
    /**
     *首次签到
     * @param signin
     * @return Integer
     */
    Integer signFirst(Signin signin);
}
