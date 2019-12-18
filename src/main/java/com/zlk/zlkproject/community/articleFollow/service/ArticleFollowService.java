package com.zlk.zlkproject.community.articleFollow.service;

/**
 * @program: ArticleFollowService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/17 9:06
 */
public interface ArticleFollowService {

    //添加关注
    Integer saveFollow(String toUserId,String fromUserId);
    //取消关注
    Integer removeFollow(String toUserId,String fromUserId);
    //查询用户之间关注关系
    Integer findFollowStatus(String toUserId,String fromUserId);
}
