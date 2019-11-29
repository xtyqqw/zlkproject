package com.zlk.zlkproject.user.personal.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.MyFollower;
import com.zlk.zlkproject.user.personal.service.PersonalFollowService;
import com.zlk.zlkproject.user.until.FiveMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    /*@RequestMapping("/toMyfoces")
    public String myfoces(){
        return "view/personal/myfocus";
    }*/

    /**
     * 方法用途：点击我的关注后调用该方法 查询出我关注的所有其他用户相关信息
     * 参数类型：HttpServletRequest 用途 从session中后去操作的userId
     * 返回值类型：modelAndView 内填入页面地址和对应用户信息的集合
     * */
//    @RequestMapping(value = "/follower")
//    @ResponseBody
//    public Map personalFollow(HttpServletRequest request, FollowerPage followerPage){
//        Map map = new HashMap();
//        String userId = (String) request.getSession().getAttribute("userId");
//        //测试用数据
//        userId = "1";
//        //模拟数据
//        followerPage.setLimit(10);
//        followerPage.setPage(1);
//        followerPage.setUserId(userId);
//        List<User> followerList = personalFollowService.findFollower(followerPage);
//        List<MyFollower> list = new ArrayList<MyFollower>();
//        //根据查询出的User获取页面所需参数
//        for(int i = 0;i < followerList.size();i++){
//            MyFollower m = new MyFollower();
//            User user = followerList.get(i);
//            m.setUserId(user.getUserId());
//            m.setUserRealname(user.getUserRealname());
//            m.setUserAllTime(user.getUserAllTime());
//            m.setUserDateTime(user.getUserDateTime());
//            m.setUserImg(user.getUserImg());
//            m.setUserRealimg(user.getUserRealimg());
//            m.setFollowedNum(personalFollowService.findFollowedNum(userId));
//            m.setFollowerNum(personalFollowService.findFollowerNum(userId));
//            m.setList(personalFollowService.findUserAction(user.getUserId()));
//            m = FiveMsg.userFiveMsg(m);
//            list.add(i,m);
//        }
//        map.put("list",list);
//        return map;
//    }

    @RequestMapping(value = "/follower")
    public ModelAndView personalFollow(HttpServletRequest request, FollowerPage followerPage){
        ModelAndView mv = new ModelAndView();
        Map map = new HashMap();
        followerPage.setLimit(5);
        followerPage.setPage(1);
        String userId = (String) request.getSession().getAttribute("userId");
        //测试用数据
        userId = "1";
        //模拟数据
        followerPage.setLimit(10);
        followerPage.setPage(1);
        followerPage.setUserId(userId);
        List<User> followerList = personalFollowService.findFollower(followerPage);
        List<MyFollower> list = new ArrayList<MyFollower>();
        //根据查询出的User获取页面所需参数
        for(int i = 0;i < followerList.size();i++){
            MyFollower m = new MyFollower();
            User user = followerList.get(i);
            m.setUserId(user.getUserId());
            m.setUserRealname(user.getUserRealname());
            m.setUserAllTime(user.getUserAllTime());
            m.setUserDateTime(user.getUserDateTime());
            m.setUserImg(user.getUserImg());
            m.setUserRealimg(user.getUserRealimg());
            m.setFollowedNum(personalFollowService.findFollowedNum(userId));
            m.setFollowerNum(personalFollowService.findFollowerNum(userId));
            m.setList(personalFollowService.findUserAction(user.getUserId()));
            m = FiveMsg.userFiveMsg(m);
            list.add(i,m);
        }
        mv.setViewName("view/personal/myfocus");
        mv.addObject("list",list);
        map.put("list",list);
        return mv;
    }

    /**
     * 方法用途：点击‘n人关注了ta’ 后调用该方法 查询出对应关注的所有其他用户相关信息
     * 参数类型：String 用途：对应用户的userId用于查询相关信息
     * 返回值类型：modelAndView 内填入页面地址和对应用户信息的集合
     * */
    @RequestMapping(value = "/userfollower")
    public ModelAndView userFollower(FollowerPage followerPage){
        Map map = new HashMap();
        ModelAndView mv = new ModelAndView();
        MyFollower m = new MyFollower();
        List<User> followerList = personalFollowService.findFollower(followerPage);
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
            m.setFollowedNum(personalFollowService.findFollowedNum(followerPage.getUserId()));
            m.setFollowerNum(personalFollowService.findFollowerNum(followerPage.getUserId()));
            m = FiveMsg.userFiveMsg(m);
            list.add(m);
        }
        map.put("list",list);
        mv.setViewName("view/personal/followhim");
        mv.addObject("list",list);
        return mv;
    }

    /**
     * 方法用途：点击‘ta关注了n人’ 后调用该方法 查询出对应关注的所有其他用户相关信息
     * 参数类型：String 用途：对应用户的userId用于查询相关信息
     * 返回值类型：modelAndView 内填入页面地址和对应用户信息的集合
     * */
    @RequestMapping(value = "/userfollowed")
    public ModelAndView userFollowed(FollowerPage followerPage){
        Map map = new HashMap();
        ModelAndView mv = new ModelAndView();
        MyFollower m = new MyFollower();
        List<User> followerList = personalFollowService.findFollowed(followerPage);
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
            m.setFollowedNum(personalFollowService.findFollowedNum(followerPage.getUserId()));
            m.setFollowerNum(personalFollowService.findFollowerNum(followerPage.getUserId()));
            m = FiveMsg.userFiveMsg(m);
            list.add(m);
        }
        map.put("list",list);
        mv.addObject("list",list);
        mv.setViewName("/view/personal/hefollows");
        return mv;
    }

    /**
     * 方法用途：点击关注他后调用该方法
     * 参数类型：HttpServletRequest 用途：获取操作用户的userId ；String 用途：获取将要关注的用户Id
     * 返回值类型：map 内加入方法运行后返回的标识 1代表成功 其他表示失败
     * */
    @RequestMapping(value = "/follow")
    @ResponseBody
    public Map<Object,String> follow(HttpServletRequest request,String userId){
        Map<Object,String> map = new HashMap<>();
        String userId1 = (String) request.getSession().getAttribute("userId");
        Integer result = personalFollowService.follow(userId1,userId);
        String code = result.toString();
        map.put("code",code);
        return map;
    }

    /**
     * 方法用途：点击已关注后调用该方法 用于取消关注
     * 参数类型：HttpServletRequest 用途：获取操作用户的userId ；String 用途：获取将要取消关注的用户Id
     * 返回值类型：map 内加入方法运行后返回的标识 1代表成功 其他表示失败
     * */
    @RequestMapping(value = "/defollow")
    @ResponseBody
    public Map<Object,String> deFollow(HttpServletRequest request,String userId){
        Map<Object,String> map = new HashMap<>();
        String userId1 = (String) request.getSession().getAttribute("userId");
        Integer result = personalFollowService.deFollow(userId1,userId);
        String code = result.toString();
        map.put("code",code);
        return map;
    }
}
