package com.zlk.zlkproject.admin.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.zlk.zlkproject.admin.service.FunctionService;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.entity.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    @Autowired
    private LogUtil logUtil;

    /**
     * @return java.lang.String
     * @Author lufengxiang
     * @Description //TODO 动态获取菜单栏
     * @Date 16:49 2019/11/20
     * @Param [request]
     **/
    @RequestMapping(value = "/findFunction")
    @ResponseBody
    public String findFunction(HttpServletRequest request) {
        String adminName = (String) request.getSession().getAttribute("loginName");
        List<Function> functionList = functionService.findFunctionByAdminName(adminName);
        String json = JSON.toJSONString(functionList);
        return json;
    }

    /**
     * @return java.lang.String
     * @Author lufengxiang
     * @Description //TODO 跳转到菜单管理
     * @Date 9:25 2019/11/25
     * @Param []
     **/
    @RequestMapping(value = "/toFunctionManager")
    public String toFunctionManager() {
        return "admin/functionManager";
    }

    /**
     * @return java.lang.String
     * @Author lufengxiang
     * @Description //TODO 查询全部菜单
     * @Date 15:52 2019/11/27
     * @Param []
     **/
    @RequestMapping(value = "/findAllFunction")
    @ResponseBody
    public String findAllFunction() {
        List<Function> functionList = functionService.functionManager();
        return JSON.toJSONString(functionList);
    }

    /**
     * @return java.util.Map<java.lang.String, java.lang.Object>
     * @Author lufengxiang
     * @Description //TODO 菜单管理数据接口
     * @Date 10:05 2019/11/25
     * @Param [request]
     **/
    @RequestMapping(value = "/functionManager")
    @ResponseBody
    public Map<String, Object> functionManager(HttpServletRequest request) {
        Map<String, Object> map = new HashMap<>();
        List<Function> functionList = functionService.functionManager();
        map.put("code", "0");
        map.put("msg", "true");
        map.put("data", functionList);
        return map;
    }

    /**
     * @return org.springframework.web.servlet.ModelAndView
     * @Author lufengxiang
     * @Description //TODO 菜单管理点击添加
     * @Date 17:51 2019/11/25
     * @Param [function]
     **/
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Function function, @RequestParam(value = "addFunction") String addFunction) {

        ModelAndView mv = new ModelAndView();

        //判断菜单名称是否重复
        Function functionByFunctionName = functionService.findFunctionByFunctionName(function.getName());
        if (functionByFunctionName != null) {
            mv.addObject("flag", "true");
            mv.addObject("msg", "菜单名称已存在");
            mv.setViewName("admin/functionManager");
            return mv;
        }

        //解析前台勾选权限
        List<Function> functionList = JSONArray.parseArray(addFunction, Function.class);
        function.setPid(functionList.get(0).getId());
        //新增菜单
        Integer flag = functionService.addFunction(function);
        if (flag == 1) {
            mv.addObject("flag", "true");
            mv.addObject("msg", "添加成功");
            mv.setViewName("admin/functionManager");
            return mv;
        } else {
            mv.addObject("flag", "true");
            mv.addObject("msg", "遇到意外错误");
            mv.setViewName("admin/functionManager");
            return mv;
        }
    }

    /**
     * @return org.springframework.web.servlet.ModelAndView
     * @Author lufengxiang
     * @Description //TODO 修改菜单
     * @Date 15:14 2019/11/27
     * @Param [function, request]
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Function function, HttpServletRequest request) {

        ModelAndView mv = new ModelAndView();

        //修改前菜单信息
        Function functionByFunctionId = functionService.findFunctionByFunctionId(function.getId());
        //判断菜单名称是否重复
        Function functionByFunctionName = functionService.findFunctionByFunctionName(function.getName());
        if (!functionByFunctionId.getName().equals(function.getName()) && functionByFunctionName != null) {
            mv.addObject("flag", "true");
            mv.addObject("msg", "菜单名称已存在");
            mv.setViewName("admin/functionManager");
            return mv;
        }

        //修改菜单信息
        Integer flag = functionService.updateFunction(function);
        if (flag == 1) {
            mv.addObject("flag", "true");
            mv.addObject("msg", "修改成功");
            mv.setViewName("admin/functionManager");
            //保存修改菜单日志
            logUtil.setLog(request, "修改了菜单名为" + functionByFunctionId.getName() + "的菜单");
            return mv;
        } else {
            mv.addObject("flag", "true");
            mv.addObject("msg", "遇到意外错误");
            mv.setViewName("admin/functionManager");
            return mv;
        }
    }

    /**
     * @return java.lang.String
     * @Author lufengxiang
     * @Description //TODO 删除菜单
     * @Date 15:51 2019/11/27
     * @Param [functionId, request]
     **/
    @RequestMapping(value = "/delete")
    public String delete(Integer functionId, HttpServletRequest request) {
        //获取删除前菜单信息
        Function functionByFunctionId = functionService.findFunctionByFunctionId(functionId);
        //删除权限一并删除角色拥有的该权限
        Integer flag1 = functionService.deleteFunctionAndRoleByFunctionId(functionId);
        Integer flag = functionService.deleteFunction(functionId);
        //保存删除菜单日志
        logUtil.setLog(request, "删除了菜单名称为" + functionByFunctionId.getName() + "的菜单");
        return "admin/functionManager";
    }

    /**
     * @return java.lang.String
     * @Author lufengxiang
     * @Description //TODO 通过角色ID查询拥有权限信息(修改角色回显权限)
     * @Date 15:51 2019/11/27
     * @Param [roleId]
     **/
    @RequestMapping(value = "/findFunctionByRoleId")
    @ResponseBody
    public String findFunctionByRoleId(String roleId) {
        List<Function> functionList = functionService.findFunctionByRoleId(roleId);
        return JSON.toJSONString(functionList);
    }

    /**
     * @return java.lang.String
     * @Author lufengxiang
     * @Description //TODO 新增及修改查询可选目录
     * @Date 14:07 2019/11/29
     * @Param []
     **/
    @RequestMapping(value = "/findFunctionByUrl")
    @ResponseBody
    public String findFunctionByUrl() {
        List<Function> functionByUrl = functionService.findFunctionByUrl();
        return JSON.toJSONString(functionByUrl);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 修改菜单回显
     * @Date 14:09 2019/11/29
     * @Param [id]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/findParentFunctionByFunctionId")
    @ResponseBody
    public String findFunctionByFunctionId(Integer id){
        Function function = functionService.findParentFunctionByFunctionId(id);
        return JSON.toJSONString(function);
    }
}
