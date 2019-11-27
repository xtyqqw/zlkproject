package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.UserAction;

import java.util.List;

/**
 * @program: 查询关注与被关注
 * @description:
 * @author: xty
 * @create: 2019/11/25 10:51
 **/
public interface PersonalFollowService {
    //查询关注自己的用户信息
    List<User> findFollower(String userId);
    //查询自己关注的用户信息
    List<User> findFollowed(String userId);
    //查询用户动态
    List<UserAction> findUserAction(String userId);
}
