package com.zlk.zlkproject.community.articleFollow.service.impl;

import com.zlk.zlkproject.community.articleFollow.mapper.ArticleFollowMapper;
import com.zlk.zlkproject.community.articleFollow.service.ArticleFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: ArticleFollowServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/17 9:14
 */

@Service
public class ArticleFollowServiceImpl implements ArticleFollowService {

    @Autowired
    private ArticleFollowMapper articleFollowMapper;

    @Override
    public Integer saveFollow(String toUserId, String fromUserId) {
        return articleFollowMapper.saveFollow(toUserId, fromUserId);
    }

    @Override
    public Integer removeFollow(String toUserId, String fromUserId) {
        return articleFollowMapper.removeFollow(toUserId, fromUserId);
    }

    @Override
    public Integer findFollowStatus(String toUserId, String fromUserId) {
        return articleFollowMapper.findFollowStatus(toUserId, fromUserId);
    }
}
