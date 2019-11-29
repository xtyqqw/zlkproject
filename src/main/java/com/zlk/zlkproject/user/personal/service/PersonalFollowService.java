package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.FollowerPage;
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
    List<User> findFollower(FollowerPage followerPage);
    //查询关注自己的人数
    Integer findFollowerNum(String userId);
    //查询自己关注的用户信息
    List<User> findFollowed(FollowerPage followerPage);
    //查询自己关注的用户人数
    Integer findFollowedNum(String userId);
    //查询用户动态
    List<UserAction> findUserAction(String userId);
    //添加关注
    Integer follow(String toUserId,String fromUserId);
    //取消关注
    Integer deFollow(String toUserId,String fromUserId);
    //查询量用户之间关注关系
    Integer findAFollowedB(String toUserId,String fromUserId);
}
