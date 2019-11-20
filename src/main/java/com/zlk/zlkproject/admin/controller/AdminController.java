package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.AdminService;
import com.zlk.zlkproject.admin.service.LogService;
import com.zlk.zlkproject.admin.service.LoginService;
import com.zlk.zlkproject.admin.service.RoleService;
import com.zlk.zlkproject.admin.util.IDUtil;
import com.zlk.zlkproject.admin.util.MD5Util;
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
    @Autowired
    private LogService logService;

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
        //判断用户名是否已存在
        Admin adminByAdminName = loginService.findAdminByAdminName(admin.getAdminName());
        if(adminByAdminName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该用户名已存在");
            mv.setViewName("admin/adminManager");
            return mv;
        }
        //放UUID和密码加密
        admin.setAdminId(IDUtil.getUUID());
        admin.setAdminPassword(MD5Util.md5Encrypt32Lower(admin.getAdminPassword()));
        Integer flag = adminService.addAdmin(admin);
        //添加用户角色中间表记录
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
     * @Date 10:50 2019/11/20
     * @Param [admin, request]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Admin admin,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        /**
         * 判断用户名是否更改
         * 如果更改过则判断更改后的用户名是否存在
         **/
        Admin adminByAdminId = adminService.findAdminByAdminId(admin.getAdminId());
        Admin adminByAdminName = loginService.findAdminByAdminName(admin.getAdminName());
        if(!admin.getAdminName().equals(adminByAdminId.getAdminName())&&adminByAdminName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该用户名已存在");
            mv.setViewName("admin/adminManager");
            return mv;
        }
        //密码加密
        if(!adminByAdminId.getAdminPassword().equals(admin.getAdminPassword())){
            admin.setAdminPassword(MD5Util.md5Encrypt32Lower(admin.getAdminPassword()));
        }
        Integer flag = adminService.updateAdminByAdminId(admin);
        //修改用户角色中间表信息
        Role roleByRoleName = roleService.findRoleByRoleName(admin.getAdminRole());
        Integer flag1 = adminService.updateAdminAndRoleByAdminId(admin.getAdminId(), roleByRoleName.getRoleId());
        if(flag==1&&flag1==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/adminManager");
            //记录修改用户日志
            Log log=new Log();
            log.setName((String) request.getSession().getAttribute("loginName"));
            log.setDescription("修改了后台用户"+admin.getAdminName()+"的信息");
            log.setTime(new Date());
            logService.addLog(log);
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
     * @Date 10:48 2019/11/20
     * @Param [adminId, request]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/delete")
    public String delete(String adminId,HttpServletRequest request){
        //获取删除前用户信息
        Admin adminByAdminId = adminService.findAdminByAdminId(adminId);
        //删除用户及用户角色中间表记录
        Integer flag = adminService.deleteAdminByAdminId(adminId);
        Integer flag1 = adminService.deleteAdminAndRoleByAdminId(adminId);
        if(flag==1&&flag1==1){
            //记录删除用户日志
            Log log=new Log();
            log.setName((String) request.getSession().getAttribute("loginName"));
            log.setDescription("删除了后台用户"+adminByAdminId.getAdminName()+"的信息");
            log.setTime(new Date());
            logService.addLog(log);
        }
        return "admin/adminManager";
    }
}
