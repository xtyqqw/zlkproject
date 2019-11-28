package com.zlk.zlkproject.user.personal.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.MyFollower;
import com.zlk.zlkproject.user.personal.service.PersonalFollowService;
import com.zlk.zlkproject.user.until.FiveMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: PersonalFollowController
 * @description: 用户关注与被关注controller
 * @author: xty
 * @create: 2019/11/25 10:39
 **/
@Controller
@RequestMapping(value = "/follow")
public class PersonalFollowController {
    @Autowired
    PersonalFollowService personalFollowService;
    @RequestMapping(value = "/follower")
    public ModelAndView personalFollow(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        MyFollower m = new MyFollower();
        String userId = (String) request.getSession().getAttribute("userId");
        //测试用数据
        userId = "1";
        List<User> followerList = personalFollowService.findFollower(userId);
        List<MyFollower> list = new ArrayList<MyFollower>();
        //根据查询出的User获取页面所需参数
        for(int i = 0;i < followerList.size();i++){
            User user = followerList.get(i);
            m.setUserId(user.getUserId());
            m.setUserRealname(user.getUserRealname());
            m.setUserAllTime(user.getUserAllTime());
            m.setUserDateTime(user.getUserDateTime());
            m.setUserImg(user.getUserImg());
            m.setUserRealimg(user.getUserRealimg());
            m.setFollowedNum(personalFollowService.findFollowed(user.getUserId()).size());
            m.setFollowerNum(personalFollowService.findFollower(user.getUserId()).size());
            m.setList(personalFollowService.findUserAction(user.getUserId()));
            m = FiveMsg.userFiveMsg(m);
            list.add(m);
        }
        mv.setViewName("/");
        mv.addObject("list",list);
        return mv;
    }

    @RequestMapping(value = "/userfollower")
    public ModelAndView userFollower(String userId){
        ModelAndView mv = new ModelAndView();
        MyFollower m = new MyFollower();
        List<User> followerList = personalFollowService.findFollower(userId);
        List<MyFollower> list = new ArrayList<MyFollower>();
        //根据查询出的User获取页面所需参数
        for(int i = 0;i < followerList.size();i++){
            User user = followerList.get(i);
            m.setUserId(user.getUserId());
            m.setUserRealname(user.getUserRealname());
            m.setUserAllTime(user.getUserAllTime());
            m.setUserDateTime(user.getUserDateTime());
            m.setUserImg(user.getUserImg());
            m.setUserRealimg(user.getUserRealimg());
            m.setFollowedNum(personalFollowService.findFollowed(user.getUserId()).size());
            m.setFollowerNum(personalFollowService.findFollower(user.getUserId()).size());
            m = FiveMsg.userFiveMsg(m);
            list.add(m);
        }
        return mv;
    }

    @RequestMapping(value = "/userfollowed")
    public ModelAndView userFollowed(String userId){
        ModelAndView mv = new ModelAndView();
        MyFollower m = new MyFollower();
        List<User> followerList = personalFollowService.findFollowed(userId);
        List<MyFollower> list = new ArrayList<MyFollower>();
        //根据查询出的User获取页面所需参数
        for(int i = 0;i < followerList.size();i++){
            User user = followerList.get(i);
            m.setUserId(user.getUserId());
            m.setUserRealname(user.getUserRealname());
            m.setUserAllTime(user.getUserAllTime());
            m.setUserDateTime(user.getUserDateTime());
            m.setUserImg(user.getUserImg());
            m.setUserRealimg(user.getUserRealimg());
            m.setFollowedNum(personalFollowService.findFollowed(user.getUserId()).size());
            m.setFollowerNum(personalFollowService.findFollower(user.getUserId()).size());
            m = FiveMsg.userFiveMsg(m);
            list.add(m);
        }
        return mv;
    }
}
