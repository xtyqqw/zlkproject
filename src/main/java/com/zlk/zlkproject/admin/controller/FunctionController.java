package com.zlk.zlkproject.admin.controller;

import com.alibaba.fastjson.JSON;
import com.zlk.zlkproject.admin.service.FunctionService;
import com.zlk.zlkproject.entity.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
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
}
