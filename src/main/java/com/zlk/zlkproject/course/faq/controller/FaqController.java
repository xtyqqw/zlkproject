package com.zlk.zlkproject.course.faq.controller;

import com.zlk.zlkproject.course.faq.service.FaqService;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Faq;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName faqController
 * @Description:
 * @Author LuanKe
 * Date 2019/11/25 14:43
 **/
@Controller
@RequestMapping(value="/Faq")
public class FaqController {
    @Autowired
    private FaqService faqService;
    @RequestMapping(value = "/findFaqList")
    @ResponseBody
    public Map<String,Object> findFaqList(Pagination pagination)throws Exception{

        List<Faq> faqList=faqService.findFaqerList(pagination);
        for(Faq faq:faqList){
            System.out.println(faq.getCoursesId());
        }
        Map<String,Object> map=new HashMap<>();
        map.put("faqList",faqList);
        return map;
    }

}
