package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.FollowerPage;
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
    public List<User> findFollower(FollowerPage followerPage) {
       followerPage.setIndex((followerPage.getPage()-1)*followerPage.getLimit());
       List<User> list = followerMapper.findFollower(followerPage);
       return list;
    }

    @Override
    public Integer findFollowerNum(String userId) {
        return followerMapper.findFollowerNum(userId);
    }

    @Override
    public List<User> findFollowed(FollowerPage followerPage) {
        followerPage.setIndex((followerPage.getPage()-1)*followerPage.getLimit());
        List<User> list = followerMapper.findFollowed(followerPage);
        return list;
    }

    @Override
    public Integer findFollowedNum(String userId) {
        return followerMapper.findFollowedNum(userId);
    }

    /**
     * 方法用途：用于查询用户的最近7天内的最多6条动态
     * 方法实现逻辑：根据数据库action表中的用户操作类型分别给对应属性赋值
     *              1/4代表文章/问题的提出 2/5代表评论文章/回答问题 3/6代表回复文章的评论/回复问题的回答
     * 参数类型: String 用于获取对应用户的Id
     * 返回值类型: List<UserAction> 用户动态实体对象的集合
     * */
    @Override
    public List<UserAction> findUserAction(String userId) {
        List<UserAction> list = followerMapper.findActionById(userId);
        if (list.size() == 0){
            return list;
        }else {
            int length = list.size();
            for(int i = 0;i<length;i++){
                UserAction userAction = list.get(i);
                userAction.setLeaveTime(LeaveTime.leaveTime(userAction.getCreateTime()));
                userAction.setDateFormat(LeaveTime.formatDate(userAction.getCreateTime()));
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
                list.set(i,userAction);
            }
            return list;
        }

    }

    @Override
    public Integer follow(String toUserId, String fromUserId) {
        return followerMapper.follow(toUserId,fromUserId);
    }

    @Override
    public Integer deFollow(String toUserId, String fromUserId) {
        return followerMapper.deFollow(toUserId,fromUserId);
    }

    @Override
    public Integer findAFollowedB(String toUserId, String fromUserId) {
        return followerMapper.findAFollowedB(toUserId,fromUserId);
    }
}
