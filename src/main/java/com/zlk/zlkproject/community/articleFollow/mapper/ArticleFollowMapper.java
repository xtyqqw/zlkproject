package com.zlk.zlkproject.community.articleFollow.mapper;

import org.apache.ibatis.annotations.Mapper;

/**
 * @program: ArticleFollowMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/17 9:06
 */

@Mapper
public interface ArticleFollowMapper {

    //添加关注
    Integer saveFollow(String toUserId,String fromUserId);
    //取消关注
    Integer removeFollow(String toUserId,String fromUserId);
    //查询用户之间关注关系
    Integer findFollowStatus(String toUserId,String fromUserId);
}
