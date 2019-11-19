package com.zlk.zlkproject.user.signup.controller;

import com.aliyuncs.exceptions.ClientException;
import com.zlk.zlkproject.user.until.GetCode;
import com.zlk.zlkproject.user.until.SmsUtil;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
@RequestMapping(value = "/user")
public class UserController {

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
    public Map<String,Object> jsonTest( HttpServletRequest request, HttpServletResponse response){
      GetCode getCode = new GetCode();
      String userPhonenu = request.getParameter("userPhonenum");
      System.out.println(userPhonenu);
      Map<String,Object> map = new HashMap<String,Object>();
      String code = getCode.getCode();
      map.put("code",code);
      return map;
    }
}
