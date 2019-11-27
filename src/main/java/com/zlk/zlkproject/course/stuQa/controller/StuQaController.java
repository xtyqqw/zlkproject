package com.zlk.zlkproject.course.stuQa.controller;

import com.alibaba.druid.sql.ast.SQLSetQuantifier;
import com.zlk.zlkproject.course.stuQa.service.StuQaService;
import com.zlk.zlkproject.entity.StuQa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.zlk.zlkproject.user.until.UUIDUtil;

/**
 * @program: zlkproject
 * @description: 学生问答控制器
 * @author: zyx
 * @create: 2019-11-27 15:39
 */
@Controller
@RequestMapping(value = "/stuQa")
public class StuQaController {

    @Autowired
    private StuQaService stuQaService;

    @RequestMapping(value = "/insertStuQa",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insertStuQa(HttpServletRequest request, @RequestParam String content,
                                          Integer[] tagIdArray) throws Exception{
        //获取session中的userid值
        Integer userId = (Integer) request.getSession().getAttribute("userId");
        //获取session中的sectionId值
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        StuQa stuQa = new StuQa();
        stuQa.setPId(0);
        stuQa.setUserId(userId);
        stuQa.setSectionId(sectionId);
        stuQa.setContent(content);
        stuQa.setAnswerNum(0);
        stuQa.setViewNum(0);
        stuQa.setShare("分享");
        stuQa.setReport("举报");
        stuQa.setDate(new Date());
        //添加新的stuQa,并返回信息
        String message = stuQaService.insertStuQa(stuQa, tagIdArray);
        Map<String,Object> map = new HashMap<>();
        map.put("message",message);
        return map;
    }
}
