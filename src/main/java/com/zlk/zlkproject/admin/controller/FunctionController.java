package com.zlk.zlkproject.admin.controller;

import com.alibaba.fastjson.JSON;
import com.zlk.zlkproject.admin.service.FunctionService;
import com.zlk.zlkproject.entity.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName FunctionController
 * @Description: 左侧导航栏Controller
 * @Author lufengxiang
 * Date 2019/11/20 11:39
 **/
@Controller
@RequestMapping(value = "/function")
public class FunctionController {

    @Autowired
    private FunctionService functionService;

    /**
     * @Author lufengxiang
     * @Description //TODO 动态获取菜单栏
     * @Date 16:49 2019/11/20
     * @Param [request]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/findFunction")
    @ResponseBody
    public String findFunction(HttpServletRequest request){
        String adminName = (String) request.getSession().getAttribute("loginName");
        List<Function> functionList = functionService.findFunctionByAdminName(adminName);
        String json = JSON.toJSONString(functionList);
        return json;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 跳转到菜单管理
     * @Date 9:25 2019/11/25
     * @Param []
     * @return java.lang.String
     **/
    @RequestMapping(value = "/toFunctionManager")
    public String toFunctionManager(){
        return "admin/functionManager";
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 菜单管理数据接口
     * @Date 10:05 2019/11/25
     * @Param [request]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    @RequestMapping(value = "/functionManager")
    @ResponseBody
    public Map<String,Object> functionManager(HttpServletRequest request){
        Map<String,Object> map=new HashMap<>();
        List<Function> functionList = functionService.functionManager();
        map.put("code","0");
        map.put("msg","true");
        map.put("data",functionList);
        return map;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 菜单管理点击添加
     * @Date 17:51 2019/11/25
     * @Param [function]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Function function){
        ModelAndView mv=new ModelAndView();
        Integer flag = functionService.addFunction(function);
        if (flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("admin/functionManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/functionManager");
            return mv;
        }
    }

    @RequestMapping(value = "/delete")
    public String delete(String functionId){
        Integer flag = functionService.deleteFunction(functionId);
        return "admin/functionManager";
    }
}
