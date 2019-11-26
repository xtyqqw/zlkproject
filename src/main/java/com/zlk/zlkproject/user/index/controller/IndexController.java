package com.zlk.zlkproject.user.index.controller;

import com.zlk.zlkproject.entity.*;
import com.zlk.zlkproject.user.index.service.IndexService;
import com.zlk.zlkproject.user.until.Arith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        List<Type> typeList = indexService.findTypeAll();
        List<Tag> tags = indexService.findTagsById(typeList.get(0).getTypeId());
        List<Tag> tags2 = indexService.findTagsById(typeList.get(1).getTypeId());
        List<Tag> tags3 = indexService.findTagsById(typeList.get(2).getTypeId());
        List<Tag> tags4 = indexService.findTagsById(typeList.get(3).getTypeId());
        Integer y = typeList.get(2).getTypeId();
        Integer z = typeList.get(3).getTypeId();
        List<Courses> courses = indexService.findCoursesByTypeId(typeList.get(0).getTypeId());
        List<Courses> courses2 = indexService.findCoursesByTypeId(typeList.get(1).getTypeId());
        List<Courses> courses3 = indexService.findCoursesByTypeId(typeList.get(2).getTypeId());
        List<Courses> courses4 = indexService.findCoursesByTypeId(typeList.get(3).getTypeId());
        String userId = "5";
        User user = indexService.findUsersById(userId);
        Integer rank = indexService.findUserRankById(userId);
        Integer count = indexService.findUserCount();
        Integer rankBai = Arith.divide(rank,count);
        Integer jiNeng= Arith.ride(user.getUserDateTime());
        Integer xueXi= Arith.plus(user.getUserDateTime());
        mv.addObject("userList",userList);
        mv.addObject("typeList",typeList);
        mv.addObject("user1",user);
        mv.addObject("rank",rank);
        mv.addObject("rankBai",rankBai);
        mv.addObject("jiNeng",jiNeng);
        mv.addObject("xueXi",xueXi);
        mv.addObject("tags",tags);
        mv.addObject("tags2",tags2);
        mv.addObject("tags3",tags3);
        mv.addObject("tags4",tags4);
        mv.addObject("courses",courses);
        mv.addObject("courses2",courses2);
        mv.addObject("courses3",courses3);
        mv.addObject("courses4",courses4);
        mv.setViewName("index");
        return mv;
    }
    @RequestMapping("/toFlow")
    @ResponseBody
    public Map<String,Object> findCoursesList(Pagination pagination)throws Exception{
        List<Courses> coursesList=indexService.findCoursesList(pagination);
        Map<String,Object> map=new HashMap<>();
        map.put("coursesList",coursesList);
        return map;
    }

}
