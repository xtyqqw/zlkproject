package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.RoleService;
import com.zlk.zlkproject.admin.util.IDUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName RoleController
 * @Description: 角色管理Controller
 * @Author lufengxiang
 * Date 2019/11/19 15:56
 **/
@Controller
@RequestMapping(value = "/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    /**
     * @Author lufengxiang
     * @Description //TODO 跳转到角色管理页面
     * @Date 16:02 2019/11/19
     * @Param [condition]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/toRoleManager")
    public ModelAndView toRoleManager(String condition){
        ModelAndView mv=new ModelAndView();
        mv.addObject("condition",condition);
        mv.setViewName("admin/roleManager");
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 角色管理数据接口
     * @Date 16:18 2019/11/19
     * @Param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    @RequestMapping(value = "/roleManager")
    @ResponseBody
    public Map<String,Object> roleManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Role> roleList = roleService.findRoleByLimit(pagination);
        Integer count = roleService.findTotalCountByRoleName(pagination);
        map.put("code","0");
        map.put("data",roleList);
        map.put("count",count);
        return map;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增角色
     * @Date 16:24 2019/11/19
     * @Param [role]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Role role){
        ModelAndView mv=new ModelAndView();
        Role roleByRoleName = roleService.findRoleByRoleName(role.getRoleName());
        if(roleByRoleName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该角色名已存在");
            mv.setViewName("admin/roleManager");
            return mv;
        }
        role.setRoleId(IDUtil.getUUID());
        Integer flag = roleService.addRole(role);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("admin/roleManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/roleManager");
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID修改角色信息
     * @Date 16:30 2019/11/19
     * @Param [role]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Role role){
        ModelAndView mv=new ModelAndView();
        Integer flag = roleService.updateRoleByRoleId(role);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/roleManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/roleManager");
            return mv;
        }
    }

    @RequestMapping(value = "/delete")
    public String delete(String roleId){
        roleService.deleteRoleByRoleId(roleId);
        return "admin/roleManager";
    }
}
