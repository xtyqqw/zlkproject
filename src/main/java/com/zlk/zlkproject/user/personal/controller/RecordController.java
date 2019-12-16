package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.Item;
import com.zlk.zlkproject.user.personal.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    @RequestMapping(value = "gocourses")
    public String to(){
        return "view/personal/learnrecord";
    }
    /**
     * 查询学习记录
     * @param request
     * @param pagination
     * @return
     */
    @RequestMapping(value = "/tocourses")
    @ResponseBody
    public Map<String,Object> selectItem(HttpServletRequest request, Pagination pagination) {
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        pagination.setUser(user);
        pagination.setUserId(userId);
        /*分页查询*/
        List<Item> itemList = recordService.selectCourses(pagination);
        /*查询项目总数*/
        Integer allList=recordService.findCourses(pagination);
        for(int i=0;i<itemList.size();i++){
            Integer sectionId=itemList.get(i).getSectionId();
            /*查询视频总时间*/
            Integer sum = recordService.selectUserSection(userId,sectionId);
            /*查询已观看时间*/
            Integer done = recordService.selectUserTime(userId,sectionId);
            /*已完成多少百分比*/
            long per = Math.round((100 * done) / sum);
            itemList.get(i).setPer(per);
        }
        Map<String,Object> map=new HashMap<>();
        map.put("count",allList);
        map.put("data",itemList);
        return map;
    }
}
