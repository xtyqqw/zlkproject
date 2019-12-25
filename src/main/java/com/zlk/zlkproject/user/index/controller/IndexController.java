package com.zlk.zlkproject.user.index.controller;

import com.zlk.zlkproject.entity.*;
import com.zlk.zlkproject.user.entity.Signin;
import com.zlk.zlkproject.user.index.service.IndexService;
import com.zlk.zlkproject.user.personal.service.DurationService;
import com.zlk.zlkproject.user.until.Arith;
import com.zlk.zlkproject.user.until.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import java.util.*;

/**
 * @ClassName： IndexController
 * @Description： index controller类
 * @Author： yzh
 * @Date： 2019/11/21 19:30
 */
@Controller
public class IndexController {
    @Autowired
    private DurationService durationService;
    @Autowired
    private IndexService indexService;
    private static int ExpireTime = 3600;
    @Resource
    private RedisUtil redisUtil;
    
    @RequestMapping("/")
    public ModelAndView toIndex(HttpServletRequest httpServletRequest) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<User> userList = indexService.findUsersByAllTime();
        for(User user:userList){
            user.setUserAllTimeDou(Arith.toHour(user.getUserAllTime()));
        }
        List<Type> typeList = indexService.findTypeAll();
        List<Tag> tags = indexService.findTagsById(typeList.get(0).getTypeId());
        List<Tag> tags2 = indexService.findTagsById(typeList.get(1).getTypeId());
        List<Tag> tags3 = indexService.findTagsById(typeList.get(2).getTypeId());
        List<Tag> tags4 = indexService.findTagsById(typeList.get(3).getTypeId());
        List<Courses> courses = indexService.findCoursesByTypeId(typeList.get(0).getTypeId());
        List<Courses> courses2 = indexService.findCoursesByTypeId(typeList.get(1).getTypeId());
        List<Courses> courses3 = indexService.findCoursesByTypeId(typeList.get(2).getTypeId());
        List<Courses> courses4 = indexService.findCoursesByTypeId(typeList.get(3).getTypeId());
        User user2 = (User) httpServletRequest.getSession().getAttribute("user");
        if (user2 != null){
            String userId = user2.getUserId();
            String today = indexService.findDayByDate(new Date());
            Integer todayInt = Integer.valueOf(today);
            Signin sign = indexService.findSigninByUserId(userId);
            Integer signNum;
            if(sign != null){
                String lastDay = indexService.findDayByUserId(userId);
                Integer lastDayInt;
                if(lastDay!=null){
                    lastDayInt = Integer.valueOf(lastDay);
                }else{
                    lastDayInt = 0;
                }
                if ((todayInt-lastDayInt) ==1 || (todayInt-lastDayInt) == 0){
                    signNum = sign.getSigninNum();
                }else {
                    signNum = 0;
                }
            }else{
                Signin signin1 = new Signin();
                signin1.setSigninUserId(userId);
                signin1.setSigninNum(0);
                Integer flag = indexService.signFirst(signin1);
                if (flag == 1){
                    signNum = signin1.getSigninNum();
                }else{
                    signNum = 0;
                }
            }
            User user = indexService.findUsersById(userId);
            Integer rank = indexService.findUserRankById(userId);
            Integer count = indexService.findUserCount();
            Integer rankBai = Arith.divide(rank, count);
            Double userDtime = Arith.toHour(user.getUserDateTime());
            user.setUserDateTimeDou(userDtime);
            Double userDtimes = (double) Math.round(userDtime*100)/100;
            long xueXi = (long) Math.ceil(userDtimes / 10);
            Double userAtime = Arith.toHour(user.getUserAllTime());
            user.setUserAllTimeDou(userAtime);
            Integer ful=durationService.findWanCheng(userId);
            Integer sum=durationService.findSectionAll(userId);
            long jiNeng;
            if (sum!=0){
                jiNeng=Math.round((ful*100)/sum);
            }else {
                jiNeng= 0;
            }
            mv.addObject("userList", userList);
            mv.addObject("userId",userId);
            mv.addObject("user1", user);
            mv.addObject("rank", rank);
            mv.addObject("rankBai", rankBai);
            mv.addObject("jiNeng", jiNeng);
            mv.addObject("xueXi", xueXi);
            mv.addObject("today", today);
            mv.addObject("signNum", signNum);
        }
//        if (redisUtil.hasKey("typeList")){
//           List<Object> typeL = redisUtil.lGet("typeList",0,-1);
//        }else{
//
//        }
//        redisUtil.set("typeList",typeList,ExpireTime);
        mv.addObject("typeList", typeList);
        mv.addObject("courses", courses);
        mv.addObject("courses2", courses2);
        mv.addObject("courses3", courses3);
        mv.addObject("courses4", courses4);
        mv.addObject("tags", tags);
        mv.addObject("tags2", tags2);
        mv.addObject("tags3", tags3);
        mv.addObject("tags4", tags4);
        mv.setViewName("firstpage");
        return mv;
    }

    @RequestMapping("/index/toFlow")
    @ResponseBody
    public Map<String, Object> findCoursesList(Pagination pagination) throws Exception {
        List<Courses> coursesList = indexService.findCoursesList(pagination);
        Map<String, Object> map = new HashMap<>(16);
        map.put("coursesList", coursesList);
        return map;
    }

    /**
     *验证签到方法
     * @param
     * @return Map
     */
    @RequestMapping(value = "/index/signIn", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> signIn(HttpServletRequest httpServletRequest)throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        User user2 = (User) httpServletRequest.getSession().getAttribute("user");
        if(user2 != null){
            String userId = user2.getUserId();
            String today = indexService.findDayByDate(new Date());
            String lastDay = indexService.findDayByUserId(userId);
            if (today.equals(lastDay)) {
                resultMap.put("result", "false");
            } else {
                resultMap.put("result", "true");
            }
        }else {
            resultMap.put("result", "null");
        }
        return resultMap;
    }
    /**
     *签到方法
     * @param
     * @return Map
     */
    @RequestMapping(value = "/index/toSignIn", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> toSignIn(HttpServletRequest httpServletRequest)throws Exception {
        Map<String, Object> resultMap = new HashMap<>();
        User user2 = (User) httpServletRequest.getSession().getAttribute("user");
        String userId = user2.getUserId();
        Signin signin = indexService.findSigninByUserId(userId);
        String today = indexService.findDayByDate(new Date());
        Integer todayInt = Integer.valueOf(today);
        String lastDay = indexService.findDayByUserId(userId);
        Integer lastDayInt;
        if(lastDay!=null){
            lastDayInt = Integer.valueOf(lastDay);
        }else{
            lastDayInt = 0;
        }
        if (signin != null) {
            signin.setSigninLastTime(new Date());
            Integer newNum;
            if((todayInt-lastDayInt)== 1 && todayInt != 1){
                Integer num = signin.getSigninNum();
                newNum = num+1;
            }else {
                newNum = 1;
            }
            signin.setSigninNum(newNum);
            Integer flag = indexService.signByUserId(signin);
            if (flag == 1){
                resultMap.put("result", "true");
                resultMap.put("num", newNum);
            }else{
                resultMap.put("result", "false");
            }
        } else {
            Signin signin1 = new Signin();
            signin1.setSigninLastTime(new Date());
            signin1.setSigninUserId(userId);
            signin1.setSigninNum(1);
            Integer flag = indexService.signFirst(signin1);
            if (flag == 1){
                resultMap.put("result", "true");
                resultMap.put("num", signin1.getSigninNum());
            }else{
                resultMap.put("result", "false");
            }
        }
        return resultMap;
    }
}
