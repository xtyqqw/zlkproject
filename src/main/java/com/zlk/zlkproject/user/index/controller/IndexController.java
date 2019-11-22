package com.zlk.zlkproject.user.index.controller;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.index.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * @ClassName： IndexController
 * @Description： index controller类
 * @Author： yzh
 * @Date： 2019/11/21 19:30
 */
@Controller
@RequestMapping("/index")
public class IndexController {
    @Autowired
    private IndexService indexService;

    @RequestMapping("/toIndex")
    public ModelAndView toIndex()throws Exception{
        ModelAndView mv =new ModelAndView();
        List<User> userList = indexService.findUsersByAllTime();
        String userId = "1";
        User user = indexService.findUsersById(userId);
        Integer rank = indexService.findUserRankById(userId);
        mv.addObject("userList",userList);
        mv.addObject("user1",user);
        mv.addObject("rank",rank);
        mv.setViewName("index");
        return mv;
    }
}
