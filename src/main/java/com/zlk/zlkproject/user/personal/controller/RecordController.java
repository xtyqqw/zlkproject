package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.Item;
import com.zlk.zlkproject.user.personal.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName： RecordController
 * @Description： 查询学习记录
 * @Author： sd
 * @Date： 2019/11/26 11:09
 */
@Controller
@RequestMapping(value = "/courses")
public class RecordController {
    /**
     * 注入外部资源
     */
    @Autowired
    private RecordService recordService;

    /**
     * 跳转页面
     * @return
     *//*
    @RequestMapping(value = "/tocourses")
    public String to(){
        return "view/personal/learnrecord";
    }*/

    /**
     * 根据userId查询学习记录
     * @param
     * @return
     */
    /*@RequestMapping(value = "/icourses")
    @ResponseBody
    public Map<String,Object> selectItem(FollowerPage followerPage){
        followerPage.setUserId("1");
        followerPage.setPage(1);
        followerPage.setLimit(3);
        List<Item> itemList=recordService.selectCourses(followerPage);
        Integer sum=recordService.selectUserSection("1");
        Integer done=recordService.selectUser("1");
        long per=Math.round((100*done)/sum);
        Map<String,Object> map=new HashMap<>();
        map.put("itemList",itemList);
        map.put("per",per);
        return map;
    }*/
    @RequestMapping(value = "/tocourses")
    public Map<String,Object> selectItem(HttpServletRequest request, Pagination pagination) {
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        pagination.setUser(user);
        pagination.setUserId(userId);
        List<Item> itemList = recordService.selectCourses(pagination);
        Integer sum = recordService.selectUserSection(userId);
        Integer done = recordService.selectUser(userId);
        long per = Math.round((100 * done) / sum);
        Integer all=recordService.findCourses(userId);
        Map<String,Object> map=new HashMap<>();
        map.put("count",all);
        map.put("data",itemList);
        map.put("per",per);
        return map;
    }
}
