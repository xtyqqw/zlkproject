package com.zlk.zlkproject.community.articleShow.controller;

import com.zlk.zlkproject.community.articleFollow.service.ArticleFollowService;
import com.zlk.zlkproject.community.articleShow.service.ArticleShowService;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.MyFollower;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: ArticleShowController
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 13:09
 */

@Controller
public class ArticleShowController {

    @Autowired
    private ArticleShowService articleShowService;
    @Autowired
    private ArticleFollowService articleFollowService;

    //给文章详情页提供接口
    @GetMapping(value = "/community/article-show")
    public ModelAndView articleShow(HttpServletRequest request, String articleId) {
        ModelAndView mv=new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        List<MyFollower> list=new ArrayList<>();
        List<User> list1=new ArrayList<>();
        if (user == null) {
            mv.addObject("article", articleShowService.getAndConvert(articleId));
            mv.setViewName("view/community/articleShow");
        }else if (articleId != null) {
            for (int i = 0;i < list1.size();i++){
                MyFollower mf = new MyFollower();
                User user1 = list1.get(i);
                mf.setUserId(user1.getUserId());
                mf.setFollowType(articleFollowService.findFollowStatus(user.getUserId(),user1.getUserId()));
                list.add(mf);
            }
            mv.addObject("list",list);
            mv.addObject("article", articleShowService.getAndConvert(articleId));
            String userId = "" + user.getUserId();
            request.getSession().setAttribute("articleId",articleId);
            mv.addObject("userId",userId);
            mv.setViewName("view/community/articleShow");
        }
        return mv;
    }
}
