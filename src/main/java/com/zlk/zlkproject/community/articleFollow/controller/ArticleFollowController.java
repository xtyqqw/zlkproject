package com.zlk.zlkproject.community.articleFollow.controller;

import com.zlk.zlkproject.community.articleFollow.service.ArticleFollowService;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: ArticleFollowController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/17 9:20
 */

@Controller
public class ArticleFollowController {

    @Autowired
    private ArticleFollowService articleFollowService;

    @RequestMapping(value = "/saveFollow")
    @ResponseBody
    public Map<Object,String> follow(HttpServletRequest request, String userId){
        Map<Object,String> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        Integer result = articleFollowService.saveFollow(user.getUserId(),userId);
        String code = result.toString();
        map.put("code",code);
        return map;
    }

    @RequestMapping(value = "/removeFollow")
    @ResponseBody
    public Map<Object,String> deFollow(HttpServletRequest request,String userId){
        Map<Object,String> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        Integer result = articleFollowService.removeFollow(user.getUserId(),userId);
        String code = result.toString();
        map.put("code",code);
        return map;
    }
}
