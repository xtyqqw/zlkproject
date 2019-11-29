package com.zlk.zlkproject.course.player.controller;


import com.zlk.zlkproject.course.player.service.PlayerService;
import com.zlk.zlkproject.entity.UserSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 <<<<<<< HEAD
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
    public void recordTime(@RequestParam("time") Double time){
        UserSection userSection = new UserSection();
        userSection.setUserId(1);
        userSection.setSectionId(1);
        userSection.setTime(time);
        playerService.recordTime(userSection);
    }

    @RequestMapping("readRecord")
    @ResponseBody
    public Double readRecord(){
        UserSection userSection = new UserSection();
        userSection.setUserId(1);
        userSection.setSectionId(1);
        Double res = playerService.readRecord(userSection);
        return res;
    }
}
