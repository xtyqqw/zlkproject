package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.TagService;
import com.zlk.zlkproject.admin.service.TypeService;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.Type;
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
 * @ClassName TypeController
 * @Description: 方向管理Controller
 * @Author lufengxiang
 * Date 2019/11/21 14:22
 **/
@Controller
@RequestMapping(value = "/type")
public class TypeController {

    @Autowired
    private TypeService typeService;
    @Autowired
    private TagService tagService;
    @Autowired
    private LogUtil logUtil;

    /**
     * @Author lufengxiang
     * @Description //TODO 跳转到方向管理页面
     * @Date 16:21 2019/11/21
     * @Param [condition]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/toTypeManager")
    public ModelAndView toTypeManager(String condition){
        ModelAndView mv=new ModelAndView();
        mv.addObject("condition",condition);
        mv.setViewName("admin/typeManager");
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 方向管理数据接口
     * @Date 16:22 2019/11/21
     * @Param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    @RequestMapping(value = "/typeManager")
    @ResponseBody
    public Map<String,Object> typeManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Type> typeList = typeService.findTypeByLimit(pagination);
        Integer count = typeService.findTotalCountByTypeName(pagination);
        map.put("code","0");
        map.put("count",count);
        map.put("data",typeList);
        return map;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增方向
     * @Date 16:25 2019/11/21
     * @Param [type]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Type type){
        ModelAndView mv=new ModelAndView();
        //判断方向名是否存在
        Type typeByTypeName = typeService.findTypeByTypeName(type.getTypeName());
        if (typeByTypeName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","方向名称已存在");
            mv.setViewName("admin/typeManager");
            return mv;
        }
        Integer flag = typeService.addType(type);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("admin/typeManager");

        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/typeManager");
        }
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向ID修改方向信息
     * @Date 16:39 2019/11/21
     * @Param [type,request]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Type type,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        Type typeByTypeId = typeService.findTypeByTypeId(type.getTypeId());
        Type typeByTypeName = typeService.findTypeByTypeName(type.getTypeName());
        if(!typeByTypeId.getTypeName().equals(type.getTypeName())&&typeByTypeName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","方向名称已存在");
            mv.setViewName("admin/typeManager");
            return mv;
        }
        Integer flag = typeService.updateType(type);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/typeManager");
            //记录修改方向日志
            logUtil.setLog(request,"修改了方向名为"+typeByTypeId.getTypeName()+"的信息");
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/typeManager");
        }
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向Id删除方向信息
     * @Date 9:36 2019/11/22
     * @Param [typeId, request]
     * @return java.lang.Boolean
     **/
    @RequestMapping(value = "/delete")
    @ResponseBody
    public Boolean delete(Integer typeId, HttpServletRequest request){
        Tag tag = tagService.findTagByTagTypeId(typeId);
        Type typeByTypeId = typeService.findTypeByTypeId(typeId);
        if(tag==null){
            typeService.deleteTypeByTypeId(typeId);
            //记录删除方向日志
            logUtil.setLog(request,"删除了方向名为"+typeByTypeId.getTypeName()+"的信息");
            return true;
        }else {
            return false;
        }
    }
    
}
