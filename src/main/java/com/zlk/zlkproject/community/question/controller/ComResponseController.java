package com.zlk.zlkproject.community.question.controller;

import com.zlk.zlkproject.community.question.service.ComResponseService;
import com.zlk.zlkproject.community.question.service.QuestionHomeService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.entity.Response;
import com.zlk.zlkproject.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author gby
 * @ClassName ResponseController
 * @description 社区问题回答
 * @date 2019/12/30 15:32
 */
@Controller
@RequestMapping(value = "response")
public class ComResponseController {
    @Autowired
    private ComResponseService comResponseService;
    @Autowired
    private QuestionHomeService questionHomeService;

    /*
     * @descrption  添加用户留言
     * @author gby
     * @param [response, request]
     * @return org.springframework.web.servlet.ModelAndView
     * @date 2019/12/31 10:36
     */
    @RequestMapping(value = "/addResponse")
    public ModelAndView addResponse(Response response, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        if (user==null){
            mv.addObject("spanmsg", "你还没有登录，请先登录");
            mv.setViewName("/view/signin");
            return mv;
        }
        String questionId = (String) request.getSession().getAttribute("questionId");
        response.setUser(user);
        response.setQuestionId(questionId);
        response.setResponseId(UUIDUtils.getId());
        response.setZanCount(0);
        response.setCaiCount(0);
        response.setAccept(0);
        response.setReplyCount(0);
        response.setType(1);
        response.setCreateTime(new Date());
        Integer res = comResponseService.addResponse(response);
        if (res != null) {
            mv.addObject("msg","发布成功");
        } else {
            mv.addObject("msg","发布失败");
        }
        mv.addObject("question", questionHomeService.getAndConvert(questionId));
        mv.addObject("user",user);
        mv.setViewName("/view/community/questionParticulars");
        return mv;
    }

    /*
     * @descrption 查询所有用户留言
     * @author gby
     * @param [pagination, request]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     * @date 2019/12/31 10:37
     */
    @RequestMapping(value = "/responseAll")
    @ResponseBody
    public Map<String, Object> responseAll(Pagination pagination, HttpServletRequest request) throws Exception {
        User user = (User) request.getSession().getAttribute("user");
        pagination.setUser(user);
        String questionId = (String) request.getSession().getAttribute("questionId");
        pagination.setQuestionId(questionId);
        List<Response> responseAllList = comResponseService.findAllResponse(pagination);
        Integer count = comResponseService.findResponseId(questionId);
        Map<String, Object> map = new HashMap<>();
        map.put("responseAllList", responseAllList);
        map.put("count", count);
        return map;
    }

}
