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
        /*每日学习时长*/
        Double time=Arith.toHour(lists.getUserDateTime());
        Double times = (double) Math.round(time*100)/100;
        /*学习成长量*/
        long grow = (long) Math.ceil(times / 10);
        /*技能水平*/
        Integer ful=durationService.findWanCheng(user.getUserId());
        Integer sum=durationService.findSectionAll(user.getUserId());
        long level;
        if(sum!=0){
            level=Math.round((ful*100)/sum);
        }else {
            level = 0;
        }
        /*查询用户学习总时长*/
        Integer sectionAll=durationService.selectAllTime(user.getUserId());
        /*用户参加项目的所有视频的总时长*/
        Integer finish=durationService.selectSection(user.getUserId());
        /*学习力*/
        long ability;
        if(finish!=0){
            ability = Math.round((sectionAll*100 )/ finish);
        }else {
            ability=0;
        }
        /*超过多少学生，百分比*/
        Integer all=durationService.findUser();
        Integer rank=durationService.findUserById(lists.getUserId());
        Integer rankAll=Arith.divide(rank,all);
        ModelAndView mv=new ModelAndView();
        /*超过多少学生*/
        mv.addObject("rankall",rankAll);
        mv.addObject("lists",lists);
        /*每日学习时长*/
        mv.addObject("times",times);
        /*学习成长量*/
        mv.addObject("grow",grow);
        /*技能水平*/
        mv.addObject("level",level);
        /*学习力*/
        mv.addObject("ability",ability);
        mv.setViewName("view/personal/learnlook");
        return mv;
    }

}
