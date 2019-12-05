package com.zlk.zlkproject.user.aboutus.controller.cxr;

import com.zlk.zlkproject.user.aboutus.service.cxr.ContactusService;
import com.zlk.zlkproject.user.entity.Contactus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 崔新睿
 * @data 2019/11/26 - 9:19
 */
@Controller
@RequestMapping("/contactus")
public class ContactusController {
    @Autowired
    private ContactusService contactusService;

    /**
     * 返回页面
     * @return
     */
    @RequestMapping("/toContactus")
    public String toContactus(){
        return "view/cxr/relationUs";
    }

    /**
     * 根据ID查询对象
     * @param contactusId
     * @return
     */
    @RequestMapping("/secletContactusById/{contactusId}")
    public Contactus secletContactusById( @PathVariable("{contactusId}") String contactusId){
        return contactusService.secletContactusById(contactusId);

    }
    @RequestMapping("/findContactus")
    public ModelAndView findContactus(String contactusId){
        ModelAndView mv = new ModelAndView();
        //设置要查询的ID为1
        contactusId="1";
        //调用查询方法
        Contactus contactUs=contactusService.secletContactusById(contactusId);
        mv.addObject("contactUs",contactUs);
        mv.setViewName("view/cxr/relationUs");
        return mv;

    }
}
