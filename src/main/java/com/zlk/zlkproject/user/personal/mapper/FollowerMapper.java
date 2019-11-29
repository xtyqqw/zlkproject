package com.zlk.zlkproject.user.personal.mapper;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.UserAction;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FollowerMapper {
    //查询关注自己的用户信息
    List<User> findFollower(FollowerPage followerPage);
    //查询关注自己的人数
    Integer findFollowerNum(String userId);
    //查询自己关注的用户信息
    List<User> findFollowed(FollowerPage followerPage);
    //查询自己关注的用户人数
    Integer findFollowedNum(String userId);
    //根据文章id查询文章标题
    String findArticleTittleById(String articleId);
    //根据用户id查询动态
    List<UserAction> findActionById(String userId);
    //根据用户id查询用户名
    String findUserNameByUserId(String userId);
    //根据文章id查询用户id
    String findUserIdByArticleId(String articleId);
    //根据id查询问题标题
    String findQuestionTittleById(String questionId);
    //根据问题id查询问题提出人id
    String findUserIdByQuestionId(String questionId);
    //添加关注
    Integer follow(String toUserId,String fromUserId);
    //取消关注
    Integer deFollow(String toUserId,String fromUserId);
}
