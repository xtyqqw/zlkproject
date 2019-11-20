package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.DeptService;
import com.zlk.zlkproject.admin.service.LogService;
import com.zlk.zlkproject.admin.util.IDUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Dept;
import com.zlk.zlkproject.entity.Log;
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
 * @ClassName DeptController
 * @Description: 部门管理Controller
 * @Author lufengxiang
 * Date 2019/11/19 13:53
 **/
@Controller
@RequestMapping(value = "/dept")
public class DeptController {

    @Autowired
    private DeptService deptService;
    @Autowired
    private LogService logService;

    /**
     * @Author lufengxiang
     * @Description //TODO 跳转到部门管理页面
     * @Date 14:43 2019/11/19
     * @Param [condition]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/toDeptManager")
    public ModelAndView toDeptManager(String condition){
        ModelAndView mv=new ModelAndView();
        mv.addObject("condition",condition);
        mv.setViewName("admin/deptManager");
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 获取部门集合数据接口
     * @Date 14:58 2019/11/19
     * @Param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    @RequestMapping(value = "/deptManager")
    @ResponseBody
    public Map<String,Object> deptManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Dept> deptList = deptService.findDeptByLimit(pagination);
        Integer count = deptService.findTotalCountByDeptName(pagination);
        map.put("data",deptList);
        map.put("count",count);
        map.put("code","0");
        return map;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增部门
     * @Date 15:26 2019/11/19
     * @Param [dept]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Dept dept){
        ModelAndView mv=new ModelAndView();
        Dept deptByDeptName = deptService.findDeptByDeptName(dept.getDeptName());
        if(deptByDeptName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该部门名称已存在");
            mv.setViewName("admin/deptManager");
            return mv;
        }
        dept.setDeptId(IDUtil.getUUID());
        Integer flag = deptService.addDept(dept);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("admin/deptManager");
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/deptManager");
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门ID修改部门信息
     * @Date 11:05 2019/11/20
     * @Param [dept, request]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Dept dept,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        /**
         * 判断部门名是否更改
         * 如果更改过则判断更改后的部门名是否存在
         **/
        Dept deptByDeptId = deptService.findDeptByDeptId(dept.getDeptId());
        Dept deptByDeptName = deptService.findDeptByDeptName(dept.getDeptName());
        if(!dept.getDeptName().equals(deptByDeptId.getDeptName())&&deptByDeptName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","该部门名称已存在");
            mv.setViewName("admin/deptManager");
            return mv;
        }
        //修改部门信息
        Integer flag = deptService.updateDeptByDeptId(dept);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/deptManager");
            //记录修改部门日志
            Log log=new Log();
            log.setName((String) request.getSession().getAttribute("loginName"));
            log.setDescription("修改了部门："+deptByDeptId.getDeptName()+"的信息");
            log.setTime(new Date());
            logService.addLog(log);
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/deptManager");
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门ID删除部门
     * @Date 11:05 2019/11/20
     * @Param [deptId, request]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/delete")
    public String delete(String deptId, HttpServletRequest request){
        //获取删除前部门信息
        Dept deptByDeptId = deptService.findDeptByDeptId(deptId);
        deptService.deleteDeptByDeptId(deptId);
        //记录删除部门日志
        Log log=new Log();
        log.setName((String) request.getSession().getAttribute("loginName"));
        log.setDescription("删除了部门："+deptByDeptId.getDeptName());
        log.setTime(new Date());
        logService.addLog(log);
        return "admin/deptManager";
    }
}
