package com.zlk.zlkproject.user.personal.controller;

import com.zlk.zlkproject.user.entity.MyQuestions;
import com.zlk.zlkproject.user.personal.service.FaqqService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @program: FaqqController
 * @description:
 * @author: xty
 * @create: 2019/12/3 15:59
 **/
@Controller
public class FaqqController {
    @Autowired
    FaqqService faqqService;
    @RequestMapping(value = "faqtest")
    public String faqTest(){
        List<MyQuestions> list = faqqService.findQuestion("1");
        return "";
    }
}
