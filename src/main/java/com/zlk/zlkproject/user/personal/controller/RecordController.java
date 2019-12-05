package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.Item;
import com.zlk.zlkproject.user.personal.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
    public ModelAndView selectItem(FollowerPage followerPage) {
        followerPage.setUserId("1");
        followerPage.setPage(1);
        followerPage.setLimit(3);
        List<Item> itemList = recordService.selectCourses(followerPage);
        Integer sum = recordService.selectUserSection("1");
        Integer done = recordService.selectUser("1");
        long per = Math.round((100 * done) / sum);
        ModelAndView mv=new ModelAndView();
        mv.addObject("itemList",itemList);
        mv.addObject("per",per);
        mv.setViewName("view/personal/learnrecord");
        return mv;
    }
}
