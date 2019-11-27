package com.zlk.zlkproject.user.personal.mapper;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.UserAction;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FollowerMapper {
    //查询关注自己的用户信息
    List<User> findFollower(String userId);
    //查询自己关注的用户信息
    List<User> findFollowed(String userId);
    //根据文章id查询文章标题
    String findArticleTittleById(String articleId);
    //根据用户id查询动态
    List<UserAction> findActionById(String userId);
    //根据用户id查询用户名
    String findUserNameByUserId(String userId);
    //根据文章id查询用户id
    String findUserIdByArticleId(String articleId);
}
