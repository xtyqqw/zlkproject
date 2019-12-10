package com.zlk.zlkproject.course.player.controller;


import com.zlk.zlkproject.course.player.service.PlayerService;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.entity.UserSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: zlkproject
 * @description: 播放器controller
 * @author: hry
 * @create: 2019-11-25 14:02
 */
@Controller
@RequestMapping("player")
public class PlayerController {
    @Autowired
    private PlayerService playerService;

    @RequestMapping("recordTime")
    @ResponseBody
    public void recordTime(@RequestParam("time") Double time, HttpServletRequest request){
        UserSection userSection = new UserSection();
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        userSection.setUserId(userId);
        userSection.setSectionId(sectionId);
        userSection.setTime(time);
        playerService.recordTime(userSection);
    }

    @RequestMapping("recordTimeSwitch")
    @ResponseBody
    public void recordTimeSwitch(@RequestParam("time") Double time, @RequestParam("sectionId") Integer sectionId,HttpServletRequest request){
        UserSection userSection = new UserSection();
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        userSection.setUserId(userId);
        userSection.setSectionId(sectionId);
        userSection.setTime(time);
        playerService.recordTime(userSection);
    }

    @RequestMapping("recordState")
    @ResponseBody
    public void recordState(HttpServletRequest request,@RequestParam("state") String state){
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        playerService.recordState(userId,sectionId,state);
    }

    @RequestMapping("readRecord")
    @ResponseBody
    public Double readRecord(HttpServletRequest request){
        UserSection userSection = new UserSection();
        User user = (User) request.getSession().getAttribute("user");
        String userId = "" + user.getUserId();
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        userSection.setUserId(userId);
        userSection.setSectionId(sectionId);
        Double res = playerService.readRecord(userSection);
        return res;
    }
}
