package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.QuestionHomeService;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
     * @descrption 社区首页
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/5 10:19
     */
    @RequestMapping(value = "/main")
    public String main() {

        return "/view/community/main";
    }

    /*
     * @descrption 文章首页
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/5 10:19
     */
    @RequestMapping(value = "/communityMain")
    public String communityMain() {

        return "/view/community/communityMain";
    }

    /*
     * @descrption 问答首页
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/5 10:19
     */
    @RequestMapping(value = "/questionSkip")
    public ModelAndView questionMain(String createTime,String userId)throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Question> allQuestion = questionHomeService.findQuestionByTime(createTime);
        Integer user= questionHomeService.findUserById(userId);
        mv.addObject("allQuestion",allQuestion);
        mv.addObject("user",user);
        mv.setViewName("/view/community/questionMain");
        return mv;
    }

    /*
     * @descrption 展示提问者用户信息
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/12/6 15:49
     */
    @RequestMapping(value = "/skipUser")
    public ModelAndView skip(String userId)throws Exception {
        ModelAndView mv = new ModelAndView();
        Question list = questionHomeService.findQuestionById(userId);
        mv.addObject("list",list);
        mv.setViewName("/view/community/questionMainUser");
        return mv;
    }
    @RequestMapping(value = "/myQuestion")
    public String myQuestion()throws Exception{

        return "view/community/questionMainUser";
    }

}
