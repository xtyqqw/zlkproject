package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.service.PersonalFollowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
        String userId = (String) request.getSession().getAttribute("userId");
        List<User> followedList = personalFollowService.findFollowed(userId);
        List<User> followerList = personalFollowService.findFollower(userId);
        mv.setViewName("/");
        mv.addObject("followed",followedList);
        mv.addObject("followedNum",followedList.size());
        mv.addObject("follower",followerList);
        mv.addObject("followerNum",followerList.size());
        return mv;
    }
}
