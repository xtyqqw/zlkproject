package com.zlk.zlkproject.user.aboutus.controller.cxr;

import com.zlk.zlkproject.user.aboutus.service.cxr.AboutUsService;
import com.zlk.zlkproject.user.entity.AboutUs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author 崔新睿
 * @data 2019/11/22 - 9:58
 */
@Controller
@RequestMapping("/aboutus")
public class AboutUsController {
    @Autowired
    private AboutUsService aboutUsService;

    /**
     * 返回关于我们页面
     * @return
     */
    @RequestMapping("/toAboutus")
    public String toaAboutus(){
        return "view/cxr/aboutUs_first";

    }

    /**
     * 根据ID查询单个对象
     * @param aboutusId
     * @return
     */
    @RequestMapping("/selectAboutUsById/{aboutusId}")
    public AboutUs selectAboutUsById(@PathVariable("{aboutusId}") String aboutusId){
        return aboutUsService.selectAboutUsById(aboutusId);
    }

    /**
     * 根据ID查询对象，带着数据返回页面，
     * @param aboutusId
     * @return
     */
    @RequestMapping(value = "/findAboutus")
    public ModelAndView findAboutus(String aboutusId){
        ModelAndView mv = new ModelAndView();
        //设置要查询的ID为1
        aboutusId="1";
        //调用查询单个对象的方法
        AboutUs aboutUs=aboutUsService.selectAboutUsById(aboutusId);
        mv.addObject("aboutUs",aboutUs);
        //设置视图名称，返回页面
        mv.setViewName("view/cxr/aboutUs_first");
        return mv;
    }
}
