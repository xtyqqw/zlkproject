package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.mapper.QuestionTagMapper;
import com.zlk.zlkproject.community.question.mapper.QuestionTypeMapper;
import com.zlk.zlkproject.community.question.service.QuestionService;
import com.zlk.zlkproject.community.question.service.QuestionTagService;
import com.zlk.zlkproject.community.question.service.QuestionTypeService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.Type;
import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * @author gby
 * @ClassName QuestionController
 * @description 问答
 * @date 2019/11/26 20:52
 */
@Controller
@RequestMapping(value = "question")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @Autowired
    private QuestionTypeService questionTypeService;
    @Autowired
    private QuestionTagService questionTagService;

    /*
     * @descrption 分类选择标签页面
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/29 14:39
     */
    @RequestMapping(value = "/test")
    public String test() {

        return "/view/community/articleEdit";
    }

    /*
     * @descrption 社区首页按钮
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:43
     */
    @RequestMapping(value = "/main")
    public ModelAndView main(HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        Object userId = request.getSession().getAttribute("userId");
        if (userId == null) {
            mv.setViewName("/view/signin");
            return mv;
        } else {
            mv.setViewName("/view/community/questionMain");
            return mv;
        }
    }

    /*
     * @descrption 提问提示页面
     * @author gby
     * @param
     * @return
     * @date 2019/11/26 20:58
     */
    @RequestMapping(value = "/hint")
    public String hint() {

        return "/view/community/questionGuide";
    }

    /*
     * @descrption  提问编辑页面
     * @author gby
     * @param [type, typeName]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/12/3 14:20
     */
    @RequestMapping(value = "/edit")
    public String edit() {

        return "/view/community/questionEdit";
    }

    /*
     * @descrption 发布问题
     * @author gby
     * @param []
     * @return java.lang.String
     * @date 2019/11/27 16:46
     */
    @PostMapping(value = "/addQuestion")
    public String addQuestion(Question question,Model model, String questionTitle, String questionContent, Date createTime, String typeName, String tagName) throws Exception {
        questionService.addQuestion(questionTitle, questionContent, createTime, typeName, tagName);
        question.setQuestionId(UUIDUtils.getId());
        model.addAttribute("questionTitle",questionTitle);
        model.addAttribute("questionContent",questionContent);
        model.addAttribute("createTime",createTime);
        model.addAttribute("typeName",typeName);
        model.addAttribute("tagName",tagName);
        return "/view/community/communityMain";

    }



}
