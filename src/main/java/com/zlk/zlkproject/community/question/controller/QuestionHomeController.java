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
    @RequestMapping("/questionMain")
    public String test(){
        return "/view/community/questionAll";
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
        List<Question> questionAllList = questionHomeService.findByQuestionTime(pagination);
        Integer count = questionHomeService.findQuestionCount(pagination);
        Map<String, Object> map = new HashMap<>();
        map.put("questionAllList", questionAllList);
        map.put("count",count);
        return map;
    }
/*    @RequestMapping(value = "/questionAll")
    @ResponseBody
    public Map<String, Object> questionAll(Pagination pagination, HttpServletRequest request,Question question) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        pagination.setUserId(userId);
        List<Question> questionAllList = questionHomeService.findByQuestionTime(pagination);
        Integer num = questionHomeService.findNumById(question);
        Map<String, Object> map = new HashMap<>();
        map.put("count",num);
        map.put("questionAllList", questionAllList);
        return map;
    }*/

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
/*        questionId="1047919253";*/
        Question question = questionHomeService.getAndConvert(questionId);
        mv.addObject("question",question);
        mv.setViewName("/view/community/questionParticulars");
        return mv;
    }
}
