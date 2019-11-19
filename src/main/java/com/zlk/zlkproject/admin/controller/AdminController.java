package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.AdminService;
import com.zlk.zlkproject.admin.service.LoginService;
import com.zlk.zlkproject.admin.service.RoleService;
import com.zlk.zlkproject.admin.util.IDUtil;
import com.zlk.zlkproject.admin.util.MD5Util;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Admin;
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
 * @ClassName AdminController
 * @Description: 后台用户管理Controller
 * @Author lufengxiang
 * Date 2019/11/19 10:01
 **/
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private LoginService loginService;
    @Autowired
    private RoleService roleService;

    /**
     * @Author lufengxiang
     * @Description //TODO 进入后台用户管理页面
     * @Date 12:50 2019/11/19
     * @Param [condition]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/toAdminManager")
    public ModelAndView toAdminManager(String condition){
        ModelAndView mv=new ModelAndView();
        mv.addObject("condition",condition);
        mv.setViewName("admin/adminManager");
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 后台用户管理页面数据接口
     * @Date 12:50 2019/11/19
     * @Param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    @RequestMapping(value = "/adminManager")
    @ResponseBody
    public Map<String,Object> adminManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Admin> adminList = adminService.findAdminByLimit(pagination);
        Integer count = adminService.findTotalCountByAdminName(pagination);
        map.put("code","0");
        map.put("data",adminList);
        map.put("count",count);
        return map;
    }
    
    /**
     * @Author lufengxiang
     * @Description //TODO 新增后台用户
     * @Date 13:13 2019/11/19
     * @Param [admin]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Admin admin){
        ModelAndView mv=new ModelAndView();
        Admin adminByAdminName = loginService.findAdminByAdminName(admin.getAdminName());
        if(adminByAdminName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该用户名已存在");
            mv.setViewName("admin/adminManager");
            return mv;
        }
        admin.setAdminId(IDUtil.getUUID());
        admin.setAdminPassword(MD5Util.md5Encrypt32Lower(admin.getAdminPassword()));
        Integer flag = adminService.addAdmin(admin);
        Role roleByRoleName = roleService.findRoleByRoleName(admin.getAdminRole());
        Integer flag1 = adminService.addAdminAndRole(admin.getAdminId(), roleByRoleName.getRoleId());
        if(flag==1&&flag1==1){
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("admin/adminManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/adminManager");
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID修改用户信息
     * @Date 13:25 2019/11/19
     * @Param [admin]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Admin admin){
        ModelAndView mv=new ModelAndView();
        admin.setAdminPassword(MD5Util.md5Encrypt32Lower(admin.getAdminPassword()));
        Integer flag = adminService.updateAdminByAdminId(admin);
        Role roleByRoleName = roleService.findRoleByRoleName(admin.getAdminRole());
        Integer flag1 = adminService.updateAdminAndRoleByAdminId(admin.getAdminId(), roleByRoleName.getRoleId());
        if(flag==1&&flag1==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/adminManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/adminManager");
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID删除用户
     * @Date 13:30 2019/11/19
     * @Param [adminId]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/delete")
    public String delete(String adminId){
        Integer flag = adminService.deleteAdminByAdminId(adminId);
        adminService.deleteAdminAndRoleByAdminId(adminId);
        return "admin/adminManager";
    }
}
