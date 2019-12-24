package com.zlk.zlkproject.community.question.controller;

import com.alibaba.fastjson.JSONArray;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.community.question.service.QuestionManagerService;
import com.zlk.zlkproject.entity.Question;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    public Map<String,Object> questionManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Question> questionList = questionManagerService.findQuestionByLimit(pagination);
        Integer count = questionManagerService.findCountByTitle(pagination);
        map.put("code","0");
        map.put("data",questionList);
        map.put("count",count);
        return map;
    }

    /**
     * 通过id删除问题
     * @param questionId
     * @param request
     * @return
     */
    @RequestMapping(value = "/delete")

    public String deleteQuestionById(String questionId, HttpServletRequest request){
        /**获取删除问题id*/
        Question questionByQuestionId = questionManagerService.findById(questionId);
        questionManagerService.deleteById(questionId);
        //日志记录删除问题
        logUtil.setLog(request,"删除问题标题为"+questionByQuestionId.getQuestionTitle()+"的信息");
        return "/view/community/questionManager";
    }

    /**
     * 通过id批量删除问题
     * @param data
     * @return
     */
    @RequestMapping(value = "/deleteList")
    @ResponseBody
    public String deleteQuestionById(String data){
        List<Question> questionList = JSONArray.parseArray(data, Question.class);
        questionManagerService.deletesById(questionList);
        return "/view/community/questionManager";
    }
    /*
     * @descrption 通过id跳转修改页面回显问题信息
     * @author gby
     * @param
     * @return
     * @date 2019/12/23 21:47
     */
    @RequestMapping(value = "/toUpdate")
    public ModelAndView updateBtu(Question question){
        ModelAndView mv=new ModelAndView();
        /**获取当前文章信息*/
        Question questions = questionManagerService.findById(question.getQuestionId());
        mv.addObject("questions",questions);
        mv.setViewName("/view/community/questionManagerEdit");
        return mv;

    }
    /*
     * @descrption 通过id修改问题
     * @author gby
     * @param [question, request]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/12/23 21:54
     */
    @RequestMapping(value = "/update")
    public ModelAndView update( Question question, HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        //判断文章是否更改，更改后判断更改后的文章是否存在
          Question questionById = questionManagerService.findById(question.getQuestionId());
        //修改文章信息，修改完成提交，提示:修改成功；否则，提示：修改失败
        Integer flag = questionManagerService.updateById(question);
        if(flag == 1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("/view/community/questionManager");
            //日志记录修改文章
            logUtil.setLog(request," 修改问题标题为"+questionById.getQuestionTitle()+"的信息");

            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","修改失败");
            mv.setViewName("/view/community/questionManager");
            return mv;
        }
    }



}
