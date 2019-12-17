package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.QuestionHomeService;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gby
 * @ClassName QuestionUser
 * @description 问答首页
 * @date 2019/12/6 13:59
 */
@Controller
@RequestMapping(value = "/question")
public class QuestionHomeController {
    @Autowired
    private QuestionHomeService questionHomeService;

    /*
     * @descrption 跳转全部提问
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/17 10:35
     */
    @RequestMapping("/findQuestionAll")
    public String findQuestionAll(){
        return "/view/community/questionAll";
    }
    /*
     * @descrption 点击按钮跳转登录页面
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/17 10:35
     */
    @RequestMapping("/test")
    public String test(){
        return "/view/signin";
    }
    /*
     * @descrption 跳转我的提问
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/17 10:35
     */
    @RequestMapping("/findQuestionMy")
    public String findQuestionMy(){
        return "/view/community/questionMy";
    }
    /*
     * @descrption 全部问答
     * @author gby
     * @param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @date 2019/12/10 14:25
     */
    @RequestMapping(value = "/questionAll")
    @ResponseBody
    public Map<String, Object> questionAll(Pagination pagination) throws Exception {
        List<Question> questionAllList = questionHomeService.findAll(pagination);
        Integer count = questionHomeService.findQuestionCount(pagination);
        Map<String, Object> map = new HashMap<>();
        map.put("questionAllList", questionAllList);
        map.put("count",count);
        return map;
    }
    /*
     * @descrption 我的问答
     * @author gby
     * @param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @date 2019/12/10 14:25
     */
    @RequestMapping(value = "/questionMy")
    @ResponseBody
    public Map<String, Object> questionMy(Pagination pagination) throws Exception {
        List<Question> questionMyList = questionHomeService.findByUserId(pagination);
        Integer count = questionHomeService.findQuestionCount(pagination);
        Map<String, Object> map = new HashMap<>();
        map.put("questionMyList", questionMyList);
        map.put("count",count);
        return map;
    }


    /*
     * @descrption 通过问题id查询问题详情
     * @author gby
     * @param [questionId]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/11/26 10:07
     */
    @GetMapping(value = "/findQuestion")
    public ModelAndView findQuestion(String questionId) {
        ModelAndView mv = new ModelAndView();
        Question question = questionHomeService.getAndConvert(questionId);
        mv.addObject("question",question);
        mv.setViewName("/view/community/questionParticulars");
        return mv;
    }
}
