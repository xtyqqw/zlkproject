package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.service.DurationService;
import com.zlk.zlkproject.user.until.Arith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 查询个人学习看板
 */
@Controller
@RequestMapping(value = "/duration")
public class DurationController {
    /*加载外部资源*/
    @Autowired
    private DurationService durationService;

    /**
     * 查询个人学习看板
     * @param request
     * @param userId
     * @return
     */
    @RequestMapping(value = "/select")
    @ResponseBody
    /*用视图和模型的方法查询最新的一条数据*/
    public ModelAndView list(HttpServletRequest request, String userId){
        User user = (User) request.getSession().getAttribute("user");
        User lists=durationService.selectDuration(user.getUserId());
        ModelAndView mv=new ModelAndView();
        /*查询的技能水平*/
        Integer skill=durationService.findCourses(user.getUserId());
        /*技能水平值*/
        Integer skills=Arith.ride(skill);
        /*总视频数量*/
        Integer sectionAll=durationService.selectSections();
        /*用户已完成视频数量*/
        Integer finish=durationService.selectSection(user.getUserId());
        /*学习力*/
        long ability = Math.round((finish*100 )/ sectionAll);
        /*学习成长量*/
        Integer ad = Arith.plus(lists.getUserDateTime());
        Integer all=durationService.findUser();
        Integer rank=durationService.findUserById(lists.getUserId());
        /*超过多少学生，百分比*/
        Integer rankall=Arith.divide(rank,all);
        mv.addObject("rankall",rankall);
        mv.addObject("ad",ad);
        mv.addObject("skills",skills);
        mv.addObject("lists",lists);
        mv.addObject("ability",ability);
        mv.setViewName("view/personal/learnlook");
        return mv;
    }

}
