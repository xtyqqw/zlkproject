package com.zlk.zlkproject.course.stuQa.controller;

import com.alibaba.druid.sql.ast.SQLSetQuantifier;
import com.zlk.zlkproject.course.stuQa.service.StuQaService;
import com.zlk.zlkproject.entity.StuQa;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.signup.service.SignService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

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

    /**
     *  功能栏问答信息添加
     *@method insertStuQa
     *@params [request, content, tagIdArray]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/11/28  16:31
     */
    @RequestMapping(value = "/insertStuQa",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> insertStuQa(HttpServletRequest request, @RequestParam String content,
                                          Integer[] tagIdArray) throws Exception{
        //获取session中的userid值
        User user=(User)request.getSession().getAttribute("user");
        String userId = user.getUserId();
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
        //将标签数组转换成为list集合
        List<Integer> tagIdList = Arrays.asList(tagIdArray);
        //添加新的stuQa,并返回信息
        String message = stuQaService.insertStuQa(stuQa, tagIdList);
        Map<String,Object> map = new HashMap<>();
        map.put("message",message);
        return map;
    }

    /**
     *  流加载分页查询stuQa
     *@method findStuQaList
     *@params [request,sectionId, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/11/29  11:22
     */
    @RequestMapping(value = "/findStuQaList",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findStuQaList(@RequestParam Integer sectionId, Integer page,Integer limit) throws Exception{
        //分页查询stuQa
        List<StuQa> stuQaList = stuQaService.findStuQaBySectionId(sectionId, page, limit);
        //获得全部页数
        Integer pages = stuQaService.getPages(sectionId, limit);
        Map<String,Object> map= new HashMap<>();
        map.put("stuQaList",stuQaList);
        map.put("pages",pages);
        return map;
    }

    /**
     *  流加载分页查询stuQa并按照回答数量排序
     *@method findStuQaListElite
     *@params [sectionId, page, limit]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/11/29  16:05
     */
    @RequestMapping(value = "/findStuQaListElite",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findStuQaListElite(@RequestParam Integer sectionId, Integer page,Integer limit) throws Exception{
        //分页查询stuQa并按照回答数量排序
        List<StuQa> stuQaList = stuQaService.findStuQaBySectionIdElite(sectionId, page, limit);
        //获得全部页数
        Integer pages = stuQaService.getPages(sectionId, limit);
        Map<String,Object> map= new HashMap<>();
        map.put("stuQaList",stuQaList);
        map.put("pages",pages);
        return map;
    }

    /**
     *  分享与举报按钮点击
     *@method \
     *@params [stuQa]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/2  11:35
     */
    @RequestMapping(value = "/updateShareOrReport")
    @ResponseBody
    public Map<String,Object> updateShareOrReport(@RequestBody StuQa stuQa) throws Exception{
        Integer integer = stuQaService.updateShareOrReportBySqaId(stuQa);
        Map<String,Object> map = new HashMap<>();
        if (integer >0){
            StuQa stuQa1 = stuQaService.findStuQaBySqaId(stuQa.getSqaId());
            map.put("stuQa",stuQa1);
        }
        return map;
    }

    /**
     *  查找所有当前问题下的回答
     *@method findAnswersByPId
     *@params [sqaId, sectionId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/3  11:42
     */
    @RequestMapping(value = "/findAnswersByPId",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> findAnswersByPId(@RequestParam Integer sqaId,Integer sectionId) throws Exception{
        Integer pId = sqaId;
        //分页查询回答内容
        List<StuQa> stuQaList = stuQaService.findStuQaBySectionIdAndPId(sectionId, pId);
        Map<String,Object> map= new HashMap<>();
        map.put("stuQaAnswerList",stuQaList);
        return map;
    }

    /**
     *  添加回复
     *@method insertAnswer
     *@params [request, sqaId, content]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/6  10:42
     */
    @RequestMapping(value = "/insertAnswer",method = RequestMethod.POST)
    @ResponseBody
    @Transactional
    public Map<String,Object> insertAnswer(HttpServletRequest request,@RequestParam Integer sqaId,Integer pId,String content) throws Exception{
        //获取session中的userid值
        User user=(User)request.getSession().getAttribute("user");
        String userId = user.getUserId();
        //获取session中的sectionId值
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        StuQa stuQa = new StuQa();
        if (pId==0){
            stuQa.setPId(sqaId);
        }else {
            stuQa.setPId(pId);
        }
        stuQa.setUserId(userId);
        stuQa.setSectionId(sectionId);
        stuQa.setContent(content);
//        stuQa.setAnswerNum(0);//默认为0
//        stuQa.setViewNum(0);//默认为0
        stuQa.setShare("分享");//默认
        stuQa.setReport("举报");//默认
        stuQa.setDate(new Date());
        List<Integer> tagIdList = stuQaService.findTagIdBySqaId(sqaId);
        String message = stuQaService.insertStuQa(stuQa, tagIdList);
        //更改当前id的回答数量
        if (pId==0){
            stuQaService.updateAnswerNum(sectionId,sqaId);
        }else {
            stuQaService.updateAnswerNum(sectionId,pId);
            StuQa stuQa1 = stuQaService.findStuQaBySqaId(sqaId);
            stuQa1.setAnswerNum(stuQa1.getAnswerNum()+1);
            stuQaService.updateStuQaBySqaId(stuQa1);
        }

        Map<String,Object> map = new HashMap<>();
        map.put("message",message);
        return map;
    }

}
