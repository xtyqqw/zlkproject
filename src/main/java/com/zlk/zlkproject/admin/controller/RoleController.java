package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.AdminService;
import com.zlk.zlkproject.admin.service.LogService;
import com.zlk.zlkproject.admin.service.RoleService;
import com.zlk.zlkproject.admin.util.IDUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Admin;
import com.zlk.zlkproject.entity.Log;
import com.zlk.zlkproject.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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
    @Autowired
    private AdminService adminService;
    @Autowired
    private LogService logService;

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
        //判断角色名是否重复
        Role roleByRoleName = roleService.findRoleByRoleName(role.getRoleName());
        if(roleByRoleName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该角色名已存在");
            mv.setViewName("admin/roleManager");
            return mv;
        }
        //放UUID并添加
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
     * @Date 10:50 2019/11/20
     * @Param [role, request]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Role role, HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        /**
         * 判断角色名是否更改
         * 如果更改过则判断更改后的角色名是否存在
         **/
        Role roleByRoleId = roleService.findRoleByRoleId(role.getRoleId());
        Role roleByRoleName = roleService.findRoleByRoleName(role.getRoleName());
        if(!role.getRoleName().equals(roleByRoleId.getRoleName())&&roleByRoleName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该角色名已存在");
            mv.setViewName("admin/roleManager");
            return mv;
        }
        //修改角色信息并修改拥有该角色的用户信息
        Integer flag = roleService.updateRoleByRoleId(role);
        List<Admin> adminByRoleName = adminService.findAdminByRoleName(roleByRoleId.getRoleName());
        if(adminByRoleName!=null){
            Integer flag1 = adminService.updateAdminByRoleName(role.getRoleName(), roleByRoleId.getRoleName());
        }
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/roleManager");
            //记录角色修改日志
            Log log=new Log();
            log.setName((String) request.getSession().getAttribute("loginName"));
            log.setDescription("将角色名"+roleByRoleId.getRoleName()+"，角色代码。"+roleByRoleId.getRoleCode()+"修改成角色名"+role.getRoleName()+"，角色代码"+role.getRoleCode());
            log.setTime(new Date());
            logService.addLog(log);
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
     * @Description //TODO 删除角色
     * @Date 10:47 2019/11/20
     * @Param [roleId, request]
     * @return java.lang.Boolean
     **/
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Boolean delete(String roleId,HttpServletRequest request) {
        //获取删除前角色信息
        Role roleByRoleId = roleService.findRoleByRoleId(roleId);
        /**
         * 查找是否有用户拥有该角色
         * 如果有则提示仍有用户属于该角色,无法删除
         **/
        List<Admin> adminByRoleName = adminService.findAdminByRoleName(roleByRoleId.getRoleName());
        if(adminByRoleName.size()!=0){
            return false;
        }else {
            roleService.deleteRoleByRoleId(roleId);
            //记录删除角色日志
            Log log=new Log();
            log.setName((String) request.getSession().getAttribute("loginName"));
            log.setDescription("将角色名为"+roleByRoleId.getRoleName()+"的角色删除了");
            log.setTime(new Date());
            logService.addLog(log);
            return true;
        }
    }
}
