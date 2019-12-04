package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.user.entity.MyQuestions;
import com.zlk.zlkproject.user.entity.MyResponse;
import com.zlk.zlkproject.user.personal.service.FaqqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

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
    @RequestMapping(value = "faqtest")
    public ModelAndView faqTest(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String userId = (String) request.getSession().getAttribute("userId");
        List list = faqqService.findAll("1");
        List<MyQuestions> qList = faqqService.findQuestion("1");
        List<MyResponse> rList = faqqService.findResponse("1");
        mv.setViewName("/view/personal/myquestion");
        mv.addObject("list",list);
        return mv;
    }

    @RequestMapping(value = "removeResponse")
    public void removeResponse(Integer responseId){
        faqqService.deleteResponse(responseId);
    }


    @RequestMapping(value = "updateResponse")
    public void updateResponse(MyResponse myResponse){
        faqqService.updateResponse(myResponse);
    }
}
