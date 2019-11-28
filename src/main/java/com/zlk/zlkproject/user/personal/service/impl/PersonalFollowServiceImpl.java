package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.UserAction;
import com.zlk.zlkproject.user.personal.mapper.FollowerMapper;
import com.zlk.zlkproject.user.personal.service.PersonalFollowService;
import com.zlk.zlkproject.user.until.LeaveTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: PersonalFollowServiceImpl
 * @description: 查询关注与被关注用户信息
 * @author: xty
 * @create: 2019/11/25 10:55
 **/
@Service
public class PersonalFollowServiceImpl implements PersonalFollowService {
    @Autowired
    FollowerMapper followerMapper;
    @Override
    public List<User> findFollower(String userId) {
       List<User> list = followerMapper.findFollower(userId);
        return list;
    }

    @Override
    public List<User> findFollowed(String userId) {
        List<User> list = followerMapper.findFollowed(userId);
        return list;
    }

    @Override
    public List<UserAction> findUserAction(String userId) {
        List<UserAction> list = followerMapper.findActionById(userId);
        if (list.size() == 0){
            return list;
        }else {
            int length = list.size();
            for(int i = 0;i<length;i++){
                UserAction userAction = list.get(i);
                userAction.setLeaveTime(LeaveTime.leaveTime(userAction.getCreatTime()));
                userAction.setDateFormat(LeaveTime.formatDate(userAction.getCreatTime()));
                int type = userAction.getActionType();
                String pUserId = "";
                if(type < 4){
                    //从文章表查询文章名
                    userAction.setArticleName(followerMapper.findArticleTittleById(userAction.getArticleId()));
                    //查出文章创建者
                    pUserId = followerMapper.findUserIdByArticleId(userAction.getArticleId());
                }else{
                    //从问题表查询问题名
                    userAction.setArticleName(followerMapper.findQuestionTittleById(userAction.getArticleId()));
                    //查出问题提出者
                    pUserId = followerMapper.findUserIdByQuestionId(userAction.getArticleId());
                }
                if(type == 2 || type == 3 || type == 5 || type == 6){
                    //从用户表中查出用户名赋予problemUser
                    userAction.setProblemUser(followerMapper.findUserNameByUserId(pUserId));
                    if(type == 3 || type == 6){
                        //查询回复目标人
                        userAction.setReplyUser(followerMapper.findUserNameByUserId(userAction.getReplyUserId()));
                    }
                }
                list.add(i,userAction);
            }
            return list;
        }

    }
}
