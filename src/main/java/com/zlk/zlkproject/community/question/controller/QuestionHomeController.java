package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.QuestionHomeService;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author gby
 * @ClassName QuestionUser
 * @description 用户信息
 * @date 2019/12/6 13:59
 */
@Controller
@RequestMapping(value = "questionUser")
public class QuestionHomeController {
    @Autowired
    private QuestionHomeService questionHomeService;
    /*
     * @descrption 问答首页
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/5 10:19
     */
    @RequestMapping(value = "/questionSkip")
    public ModelAndView questionMain(String createTime, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Question> allQuestion = questionHomeService.findQuestionByTime(createTime);
        mv.addObject("allQuestion", allQuestion);
        mv.setViewName("/view/community/questionMain");
        return mv;
    }
    /*
     * @descrption 通过问题id查询文章
     * @author gby
     * @param [questionId]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/11/26 10:07
     */
    @RequestMapping(value = "/find/{questionId}")
    public String find(@PathVariable String questionId,Model model) throws Exception {
        model.addAttribute("question", questionHomeService.findByQuestionId(questionId));
        return "/view/community/questionParticulars";
    }

}
