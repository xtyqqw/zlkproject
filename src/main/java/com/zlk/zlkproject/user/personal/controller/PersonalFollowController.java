package com.zlk.zlkproject.user.personal.controller;

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

    /**
     * 点击我的关注跳转
     * @return
     */
    @RequestMapping(value = "/follower")
    public ModelAndView follower(HttpServletRequest request,FollowerPage followerPage){
        ModelAndView mv = new ModelAndView();
        User user1 = (User) request.getSession().getAttribute("user");
        followerPage.setUserId(user1.getUserId());
        followerPage.setLimit(10);
        followerPage.setPage(1);
        List<User> followerList = personalFollowService.findFollower(followerPage);
        mv.setViewName("view/personal/myfocus");
        mv.addObject("count",followerList.size());
        return mv;
    }

    /**
     * 我的关注分页
     * @param request
     * @param followerPage
     * @return
     */
    @RequestMapping(value = "/myfollow")
    @ResponseBody
    public Map<String,Object> personalFollow(HttpServletRequest request, FollowerPage followerPage){
        ModelAndView mv = new ModelAndView();
        Map<String,Object> map = new HashMap();
        User user1 = (User) request.getSession().getAttribute("user");

        followerPage.setUserId(user1.getUserId());
        followerPage.setIndex((followerPage.getPage()-1)*followerPage.getLimit());
        List<User> followerList = personalFollowService.findFollower(followerPage);
        List<MyFollower> list = new ArrayList<MyFollower>();

        List<User> list1 = new ArrayList<>();
        Integer endIndex = (followerPage.getPage()-1)*followerPage.getLimit()+followerPage.getLimit();
        //手动分页
        if(followerList.size()<=endIndex){
            list1 = followerList.subList((followerPage.getPage()-1)*followerPage.getLimit(),followerList.size());
        }else {
            list1 = followerList.subList((followerPage.getPage()-1)*followerPage.getLimit(),endIndex);
        }
        //根据查询出的User获取页面所需参数
        for(int i = 0;i < list1.size();i++){
            MyFollower m = new MyFollower();
            User user = list1.get(i);
            m.setUserId(user.getUserId());
            m.setUserRealname(user.getUserRealname());
            m.setUserAllTime(user.getUserAllTime()/3600);
            m.setUserDateTime(user.getUserDateTime()/3600);
            m.setUserImg(user.getUserImg());
            m.setUserRealimg(user.getUserRealimg());
            m.setFollowedNum(personalFollowService.findFollowedNum(user.getUserId()));
            m.setFollowerNum(personalFollowService.findFollowerNum(user.getUserId()));
            m.setList(personalFollowService.findUserAction(user.getUserId()));
            m = FiveMsg.userFiveMsg(m);
            list.add(i,m);
        }
        mv.addObject("list",list);
        mv.addObject("userId",user1.getUserId());
        map.put("userId", user1.getUserId());
        map.put("list",list);
        map.put("count",followerList.size());
        return map;
    }

    /**
     * 点击“n人关注了他”跳转
     * @param userId
     * @return
     */
    @RequestMapping("/hefollows")
    public ModelAndView hefollows(String userId){
        ModelAndView mv = new ModelAndView();
        Integer count = personalFollowService.findFollowedNum(userId);
        mv.setViewName("view/personal/hefollows");
        mv.addObject("userId",userId);
        mv.addObject("count",count);
        return mv;
    }

    /**
     * 点击“他关注了n人”跳转
     * @param userId
     * @return
     */
    @RequestMapping("/followshim")
    public ModelAndView followshim(String userId){
        ModelAndView mv = new ModelAndView();
        Integer count = personalFollowService.findFollowerNum(userId);
        mv.setViewName("view/personal/followhim");
        mv.addObject("count",count);
        mv.addObject("userId",userId);
        return mv;
    }
    /**
     * 方法用途：点击‘他关注了n人’ 后调用该方法 查询出对应关注的所有其他用户相关信息
     * 参数类型：FollowerPage 用途：根据前台返回完成分页
     * 返回值类型：map 内填入页面地址和对应用户信息的集合
     * */
    @RequestMapping(value = "/userfollower")
    @ResponseBody
    public Map<String,Object> userFollower(HttpServletRequest request,FollowerPage followerPage){
        Map<String,Object> map = new HashMap();
        User user1 = (User) request.getSession().getAttribute("user");
        ModelAndView mv = new ModelAndView();


        followerPage.setIndex((followerPage.getPage()-1)*followerPage.getLimit());
        List<User> followerList = personalFollowService.findFollower(followerPage);
        List<MyFollower> list = new ArrayList<MyFollower>();

        List<User> list1 = new ArrayList<>();
        Integer endIndex = (followerPage.getPage()-1)*followerPage.getLimit()+followerPage.getLimit();
        //手动分页
        if(followerList.size()<=endIndex){
            list1 = followerList.subList((followerPage.getPage()-1)*followerPage.getLimit(),followerList.size());
        }else {
            list1 = followerList.subList((followerPage.getPage()-1)*followerPage.getLimit(),endIndex);
        }
        //根据查询出的User获取页面所需参数
        for(int i = 0;i < list1.size();i++){
            MyFollower m = new MyFollower();
            User user = list1.get(i);
            m.setUserId(user.getUserId());
            m.setUserRealname(user.getUserRealname());
            m.setUserAllTime(user.getUserAllTime()/3600);
            m.setUserDateTime(user.getUserDateTime()/3600);
            m.setUserImg(user.getUserImg());
            m.setUserRealimg(user.getUserRealimg());
            m.setFollowedNum(personalFollowService.findFollowedNum(followerPage.getUserId()));
            m.setFollowerNum(personalFollowService.findFollowerNum(followerPage.getUserId()));
            m.setFollowType(personalFollowService.findAFollowedB(user1.getUserId(),user.getUserId()));
            m = FiveMsg.userFiveMsg(m);
            list.add(m);
        }
        map.put("list",list);
        map.put("userId",user1.getUserId());
        map.put("count",followerList.size());
        /*mv.setViewName("view/personal/followhim");
        mv.addObject("userId",user1.getUserId());
        mv.addObject("list",list);*/
        return map;
    }

    /**
     * 方法用途：点击‘n人关注了他’ 后调用该方法 查询出对应关注的所有其他用户相关信息
     * 参数类型：String 用途：对应用户的userId用于查询相关信息
     * 返回值类型：modelAndView 内填入页面地址和对应用户信息的集合
     * */
    @RequestMapping(value = "/userfollowed")
    @ResponseBody
    public Map<String,Object> userFollowed(HttpServletRequest request,FollowerPage followerPage){
        Map<String,Object> map = new HashMap();
        ModelAndView mv = new ModelAndView();
        followerPage.setIndex((followerPage.getPage()-1)*followerPage.getLimit());
        User user1 = (User) request.getSession().getAttribute("user");
        List<User> followerList = personalFollowService.findFollowed(followerPage);
        List<MyFollower> list = new ArrayList<MyFollower>();
        List<User> list1 = new ArrayList<>();
        Integer endIndex = (followerPage.getPage()-1)*followerPage.getLimit()+followerPage.getLimit();
        //手动分页
        if(followerList.size()<=endIndex){
            list1 = followerList.subList((followerPage.getPage()-1)*followerPage.getLimit(),followerList.size());
        }else {
            list1 = followerList.subList((followerPage.getPage()-1)*followerPage.getLimit(),endIndex);
        }

        //根据查询出的User获取页面所需参数
        for(int i = 0;i < list1.size();i++){
            MyFollower m = new MyFollower();
            User user = list1.get(i);
            m.setUserId(user.getUserId());
            m.setUserRealname(user.getUserRealname());
            m.setUserAllTime(user.getUserAllTime()/3600);
            m.setUserDateTime(user.getUserDateTime()/3600);
            m.setUserImg(user.getUserImg());
            m.setUserRealimg(user.getUserRealimg());
            m.setFollowedNum(personalFollowService.findFollowedNum(followerPage.getUserId()));
            m.setFollowerNum(personalFollowService.findFollowerNum(followerPage.getUserId()));
            m.setFollowType(personalFollowService.findAFollowedB(user1.getUserId(),user.getUserId()));
            m = FiveMsg.userFiveMsg(m);
            list.add(i,m);
        }
        map.put("list",list);
        map.put("count",followerList.size());
        map.put("userId",user1.getUserId());
//        mv.addObject("list",list);
//        mv.setViewName("/view/personal/hefollows");
//        mv.addObject("userId",user1.getUserId());
        return map;
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
        User user = (User) request.getSession().getAttribute("user");
        Integer result = personalFollowService.follow(user.getUserId(),userId);
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
        User user = (User) request.getSession().getAttribute("user");
        Integer result = personalFollowService.deFollow(user.getUserId(),userId);
        String code = result.toString();
        map.put("code",code);
        return map;
    }
}
