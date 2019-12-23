package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.community.question.service.QuestionManagerService;
import com.zlk.zlkproject.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gby
 * @ClassName questionManager
 * @description 社区提问后台管理
 * @date 2019/12/23 15:07
 */
@Controller
@RequestMapping(value = "question")
public class QuestionManager {
    @Autowired
    private QuestionManagerService questionManagerService;
    @Autowired
    private LogUtil logUtil;
    /*
     * @descrption
     * @author gby
     * @param 跳转提问管理
     * @return
     * @date 2019/12/23 15:41
     */
    @RequestMapping(value = "/toQuestionManager")
    public ModelAndView testQuestion(String condition) throws Exception{
        ModelAndView mv = new ModelAndView();
        mv.addObject("condition",condition);
        mv.setViewName("/view/community/questionManager");
        return mv;
    }
    /**
     * 文章管理接口
     * @param pagination
     * @return
     */
    @RequestMapping(value = "/questionManager")
    @ResponseBody
    public Map<String,Object> articleManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Question> questionList = questionManagerService.findQuestionByLimit(pagination);
        Integer count = questionManagerService.findCountByTitle(pagination);
        map.put("code","0");
        map.put("data",questionList);
        map.put("count",count);
        return map;
    }



}
