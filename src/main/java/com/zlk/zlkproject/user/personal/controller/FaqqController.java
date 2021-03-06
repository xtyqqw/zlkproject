package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.entity.FollowerPage;
import com.zlk.zlkproject.user.entity.MyQuestions;
import com.zlk.zlkproject.user.entity.MyResponse;
import com.zlk.zlkproject.user.personal.service.FaqqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: FaqqController
 * @description:
 * @author: xty
 * @create: 2019/12/3 15:59
 **/
@Controller
@RequestMapping(value = "/myfaqq")
public class FaqqController {
    @Autowired
    FaqqService faqqService;
    /**
     * 方法用途：点击我的问答后调用该方法 查询出我的问答所有信息并按照时间排序
     * 参数类型：HttpServletRequest 用途 从session中后去操作的userId
     * 返回值类型：modelAndView 内填入页面地址和对应用户信息的集合
     *            其中 allCount为全部总条数 qCount为我的问题总条数 rCount为我的回答总条数
     * */
    @RequestMapping(value = "faqtest")
    public ModelAndView myQuestion(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        List list = faqqService.findAll(user.getUserId());
        List<MyQuestions> qList = faqqService.findQuestion(user.getUserId());
        List<MyResponse> rList = faqqService.findResponse(user.getUserId());
        mv.setViewName("/view/personal/myquestion");
        mv.addObject("allCount",list.size());
        mv.addObject("qCount",qList.size());
        mv.addObject("rCount",rList.size());
        return mv;
    }
    /*public ModelAndView faqTest(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        List list = faqqService.findAll(userId);
        List<MyQuestions> qList = faqqService.findQuestion(userId);
        List<MyResponse> rList = faqqService.findResponse(userId);
        mv.setViewName("/view/personal/myquestion");
        mv.addObject("qList",qList);
        mv.addObject("rList",rList);
        mv.addObject("list",list);
        return mv;
    }*/

    /**
     * 方法用途：点击我的问答中删除答案调用该方法
     * 参数类型：Integer 用途 获取对应的回答
     * 返回值类型：Map 返回方法执行结果
     * */
    @RequestMapping(value = "removeResponse")
    @ResponseBody
    public String removeResponse(Integer responseId){
        Map<String,Object> map = new HashMap<>();
        Integer code = faqqService.deleteResponse(responseId);
        if(code==1){
            return "删除成功";
        } else {
            return "删除失败";
        }
        /*map.put("code",code);
        return map;*/
    }

    /**
     * 方法用途：点击我的问答中编辑答案调用该方法
     * 参数类型：MyResponse 用途 获取对应的回答和修改的结果
     * 返回值类型：Map 返回方法执行结果
     * */
//    @RequestMapping(value = "updateResponse")
//    @ResponseBody
//    public Map<String,Object> updateResponse(MyResponse myResponse){
//        Map<String,Object> map = new HashMap<>();
//        Integer code = faqqService.updateResponse(myResponse);
//        map.put("code",code);
//        return map;
//    }

    @RequestMapping(value = "updateResponse")
    public ModelAndView updateResponse(MyResponse myResponse){
        ModelAndView mv = new ModelAndView();
        Map<String,Object> map = new HashMap<>();
        Integer code = faqqService.updateResponse(myResponse);
        if(code == 1){
            mv.setViewName("redirect:/myfaqq/faqtest");
            return mv;
        }else {
            return null;
        }
    }

    /**
     * 我的问答全部分页
     * 方法用途：查询出我的提问和我的回答全部信息
     * 参数类型：FollowerPage 通过前台传回的分页信息进行集合的裁剪
     * @param request
     * @param followerPage
     * @return
     */
    @RequestMapping(value = "faqtest1")
    @ResponseBody
    public Map<String,Object> faqTestAll(HttpServletRequest request,FollowerPage followerPage){
        Map<String,Object> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        List list = faqqService.findAll(userId);
        List list1 = new ArrayList();
        Integer sta = (followerPage.getPage()-1)*followerPage.getLimit();
        Integer end = sta + followerPage.getLimit();
        if(list.size()>=end){
            list1 = list.subList(sta,end);
        }else{
            list1 = list.subList(sta,list.size());
        }
        map.put("countAll",list.size());
        map.put("list",list1);
        return map;
    }
    /**
     * 我的提问分页
     * 方法用途：查询出我的提问全部信息
     * 参数类型：FollowerPage 通过前台传回的分页信息进行集合的裁剪
     * @param request
     * @param followerPage
     * @return
     */
    @RequestMapping(value = "faqtestq")
    @ResponseBody
    public Map<String,Object> faqTestQ(HttpServletRequest request,FollowerPage followerPage){
        Map<String,Object> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        List<MyQuestions> qList = faqqService.findQuestion(userId);
        List list1 = new ArrayList();
        Integer sta = (followerPage.getPage()-1)*followerPage.getLimit();
        Integer end = sta + followerPage.getLimit();
        if(qList.size()>=end){
            list1 = qList.subList(sta,end);
        }else{
            list1 = qList.subList(sta,qList.size());
        }
        map.put("countq",qList.size());
        map.put("qlist",list1);
        return map;
    }

    /**
     * 我的回答分页
     * 方法用途：查询出我的回答全部信息
     * 参数类型：FollowerPage 通过前台传回的分页信息进行集合的裁剪
     * @param request
     * @param followerPage
     * @return
     */
    @RequestMapping(value = "faqtestr")
    @ResponseBody
    public Map<String,Object> faqTestF(HttpServletRequest request,FollowerPage followerPage){
        Map<String,Object> map = new HashMap<>();
        User user = (User) request.getSession().getAttribute("user");
        String userId = user.getUserId();
        List<MyResponse> rList = faqqService.findResponse(userId);
        List list1 = new ArrayList();
        Integer sta = (followerPage.getPage()-1)*followerPage.getLimit();
        Integer end = sta + followerPage.getLimit();
        if(rList.size()>=end){
            list1 = rList.subList(sta,end);
        }else{
            list1 = rList.subList(sta,rList.size());
        }
        map.put("countr",rList.size());
        map.put("rlist",list1);
        return map;
    }
}
