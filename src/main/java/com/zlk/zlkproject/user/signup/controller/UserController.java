package com.zlk.zlkproject.user.signup.controller;

import com.aliyuncs.exceptions.ClientException;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.signup.service.SignService;
import com.zlk.zlkproject.user.until.GetCode;
import com.zlk.zlkproject.user.until.MD5Util;
import com.zlk.zlkproject.user.until.SmsUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.SQLOutput;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: UserController
 * @description: 用户操作控制器
 * @author: xty
 * @create: 2019/11/19 10:06
 **/
@Controller
@RequestMapping(value = "/users")
public class UserController {
    @Autowired
    SignService signService;

    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "redirect:/";
    }

    @RequestMapping(value = "/test")
    public String test() throws ClientException {
        GetCode getCode = new GetCode();
        try {
            SmsUtil.sendSms("15670557636",getCode.getCode());
        }catch (ClientException ce){
            System.out.println("验证码发送失败");
        }
        return "view/signup";
    }
    @RequestMapping(value = "tosignup")
    public String toSignup(){
        return "view/signup";
    }

    @RequestMapping(value = "/jsontest", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> jsonTest(User user, HttpServletRequest request, HttpServletResponse response){
      //创建获取code工具类对象
      GetCode getCode = new GetCode();
      //获取session
      HttpSession session = request.getSession();
        System.out.println("");
      //获取前台传输的手机号
      String userPhonenu = request.getParameter("userPhonenum");
//      Sys.out.println(userPhonenu);

      Map<String,Object> map = new HashMap<String,Object>();
      //获取验证码
      String code = getCode.getCode();
      //将验证码放入session
      session.setAttribute("code",code);
      //发送验证码
        try {
            SmsUtil.sendSms(userPhonenu,code);
        }catch (ClientException ce){
            System.out.println("验证码发送失败");
        }
      map.put("code",code);
      return map;
    }
    /**
     * 用户注册方法
     * 需传入 userPhonenum  userPwd  code 三项参数用User对象获取
     */
    @RequestMapping(value = "/signup")
    public ModelAndView signup( HttpServletRequest request,User user ,String usercode){
        //添加成功与否的标志
        Integer flag = 2;
        //获取mv
        ModelAndView mv = new ModelAndView();
        //获取session
        HttpSession session = request.getSession();
        //获取session中的验证码
        String code1 = (String) session.getAttribute("code");
        //通过手机号查找改手机号是否已经注册
        Boolean f1 = signService.findUserByPhonenum(user.getPhonenum());
        if(code1 == null){
            code1 = "x";
        }
        //判断验证码是否输入正确
        if(code1.equals(usercode)){
            if(f1){
                //提示该用户已存在
                mv.addObject("spanmsg","该用户已存在！");
                mv.setViewName("/view/signup");
                return mv;
            }else {
                //对应手机号不存在 执行注册
                flag = signService.signup(user);
                if(flag == 1){
                    mv.addObject("spanmsg","注册成功，请登录！");
                    mv.setViewName("/view/signin");
                    return mv;
                }else {
                    mv.addObject("spanmsg","注册失败，请重试");
                    mv.setViewName("/view/signup");
                    return mv;
                }
            }
        }else {
            mv.addObject("spanmsg","验证码错误请重新输入");
            mv.setViewName("/view/signup");
            return mv;
        }
//        Integer flag = signService.signup(user);
//        mv.setViewName("/view/signup");
//        return mv;
    }

    @RequestMapping(value = "/tosignin")
    public String toSignin(){
        return "/view/signin";
    }

    @RequestMapping(value = "/signupbypwd")
    public ModelAndView signinByPwd(User user,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        //获取session
        HttpSession session = request.getSession();
        String MD5Pwd = MD5Util.md5Encrypt32Lower(user.getUserPwd());
        user.setUserPwd(MD5Pwd);
        User user1 = signService.findUserByPhonenumAndPwd(user);
        if(user1!=null){
            //将user对象放入session
            session.setAttribute("user",user1);
//            mv.addObject("userId",user1.getUserId());
            //跳转至首页
            mv.setViewName("redirect:/");
            return mv;
        }else {
            mv.setViewName("view/signin");
            mv.addObject("spanmsg","用户名或密码错误");
            return mv;
        }
    }

    @RequestMapping(value = "/signupbycode")
    public ModelAndView signupBycode(User user,HttpServletRequest request,String usercode){
        ModelAndView mv = new ModelAndView();
        //获取session
        HttpSession session = request.getSession();
        String code1 = (String) session.getAttribute("code");
        if(code1 == null){
            code1 = "1l";
        }
        User user1 = signService.findUserByUserphonenum(user.getPhonenum());
        if(user1!=null){
            if (code1.equals(usercode)){
                //将验证码放入session
                session.setAttribute("user",user1);
                mv.addObject("userId",user1.getUserId());
                //跳转至首页
                mv.setViewName("redirect:/");
                return mv;
            }else {
                mv.setViewName("/view/signin");
                mv.addObject("spanmsg","验证码错误");
                return mv;
            }

        }else {
            mv.setViewName("/view/signin");
            mv.addObject("spanmsg","该用户不存在");
            return mv;
        }
    }


    @RequestMapping(value = "/changepwd")
    public ModelAndView changePwd(HttpServletRequest request,User user,String usercode){
        ModelAndView mv = new ModelAndView();
        Boolean f1 = signService.findUserByPhonenum(user.getPhonenum());
        String code = (String) request.getSession().getAttribute("code");
        if(f1){
            if(usercode.equals(code)){
                signService.changePwd(user);
                mv.addObject("spanmsg","密码修改成功，请重新登陆");
                mv.setViewName("view/signin");
                return mv;
            }else {
                mv.addObject("spanmsg","验证码错误，请重新输入");
                mv.setViewName("view/forgetpwd");
                return mv;
            }

        }else {
            mv.addObject("spanmsg","该用户不存在");
            mv.setViewName("view/forgetpwd");
            return mv;
        }
    }

    @RequestMapping(value = "/toforget")
    public String toForget(){
        return "view/forgetpwd";
    }

    /**
     *  根据id查找名字和头像
     *@method selectNameAndImg
     *@params [userId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/6  17:26
     */
    @RequestMapping(value = "/selectNameAndImg")
    @ResponseBody
    public Map<String,Object> selectNameAndImg(String userId) throws Exception{
        User user = signService.selectNameAndImg(userId);
        Map<String,Object> map= new HashMap<>();
        if (user!= null){
            map.put("user",user);
            map.put("userRealname",user.getUserRealname());
        }else {
            map.put("message","该用户已为空");
        }
        return map;
    }
}
