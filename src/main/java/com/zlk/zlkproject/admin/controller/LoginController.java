package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.LogService;
import com.zlk.zlkproject.admin.service.LoginService;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.MD5Util;
import com.zlk.zlkproject.entity.Admin;
import com.zlk.zlkproject.entity.Log;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * @ClassName LoginController
 * @Description: 管理员登陆Controller
 * @Author lufengxiang
 * Date 2019/11/18 11:02
 **/
@Controller
@RequestMapping(value = "/loginController")
public class LoginController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private LogUtil logUtil;

    /**
     * @Author lufengxiang
     * @Description //TODO 去登陆页面
     * @Date 17:04 2019/11/18
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/toLogin")
    public String toLogin(){
        return "admin/login";
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 登陆页面点击登陆
     * @Date 17:31 2019/11/18
     * @Param [request, admin]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/login")
    public ModelAndView login(HttpServletRequest request, Admin admin){

        ModelAndView mv=new ModelAndView();

        if(admin.getAdminName()==null){
            mv.setViewName("admin/login");
            return mv;
        }

        //shiro认证
        Subject subject = SecurityUtils.getSubject();
        admin.setAdminPassword(MD5Util.md5Encrypt32Lower(admin.getAdminPassword()));
        UsernamePasswordToken token=new UsernamePasswordToken(admin.getAdminName(),admin.getAdminPassword());
        try {
            subject.login(token);
            request.getSession().setAttribute("loginName",admin.getAdminName());
            loginService.updateVisitNumber();
            logUtil.setLog(request,"登陆了管理系统");
            mv.setViewName("admin/success");
            return mv;
        } catch (UnknownAccountException e) {
            e.printStackTrace();
            mv.addObject("flag","true");
            mv.addObject("error","用户名不存在");
            mv.setViewName("admin/login");
            return mv;
        } catch (IncorrectCredentialsException e){
            e.printStackTrace();
            mv.addObject("flag","true");
            mv.addObject("error","密码错误");
            mv.setViewName("admin/login");
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 返回登陆成功页面
     * @Date 17:04 2019/11/18
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/toSuccess")
    public String toSuccess(){
        return "admin/success";
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 登陆成功Iframe首页
     * @Date 17:05 2019/11/18
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/toMain")
    public ModelAndView toMain(){
        ModelAndView mv=new ModelAndView();
        Integer visitNumber = loginService.findVisitNumber();
        mv.addObject("visitNumber",visitNumber);
        mv.setViewName("admin/main");
        return mv;
    }

}
