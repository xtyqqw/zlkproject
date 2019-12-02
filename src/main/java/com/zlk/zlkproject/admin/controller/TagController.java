package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.TagService;
import com.zlk.zlkproject.admin.service.TypeService;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Tag;
import com.zlk.zlkproject.entity.Type;
import lombok.AllArgsConstructor;
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
 * @ClassName KindController
 * @Description: 类别管理Controller
 * @Author lufengxiang
 * Date 2019/11/21 10:34
 **/
@Controller
@RequestMapping(value = "/tag")
public class TagController {

    @Autowired
    private TagService tagService;
    @Autowired
    private TypeService typeService;
    @Autowired
    private LogUtil logUtil;

    /**
     * @Author lufengxiang
     * @Description //TODO 跳转到类别管理页面
     * @Date 10:37 2019/11/21
     * @Param [condition]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/toTagManager")
    public ModelAndView toTagManager(String condition){
        ModelAndView mv= new ModelAndView();
        mv.addObject("condition",condition);
        mv.setViewName("admin/tagManager");
        List<Type> typeList = typeService.findAllTypeName();
        mv.addObject("typeList",typeList);
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 类别管理数据接口
     * @Date 11:44 2019/11/21
     * @Param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    @RequestMapping(value = "/tagManager")
    @ResponseBody
    public Map<String,Object> tagManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Tag> tagList = tagService.findTagByLimit(pagination);
        Integer count = tagService.findTotalCountByTagName(pagination);
        map.put("code","0");
        map.put("data",tagList);
        map.put("count",count);
        return map;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增类别
     * @Date 14:48 2019/11/21
     * @Param [tag]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/insert")
    public ModelAndView insert(Tag tag){
        ModelAndView mv=new ModelAndView();
        Tag tagByTagName = tagService.findTagByTagName(tag.getTagName());
        if(tagByTagName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","类别名称已存在");
            mv.setViewName("admin/tagManager");
            List<Type> typeList = typeService.findAllTypeName();
            mv.addObject("typeList",typeList);
            return mv;
        }
        Type type = typeService.findTypeByTypeName(tag.getTagTypeName());
        tag.setTagTypeId(type.getTypeId());
        Integer flag = tagService.addTag(tag);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","添加成功");
            mv.setViewName("admin/tagManager");
            List<Type> typeList = typeService.findAllTypeName();
            mv.addObject("typeList",typeList);
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/tagManager");
            List<Type> typeList = typeService.findAllTypeName();
            mv.addObject("typeList",typeList);
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过类别ID修改类别信息
     * @Date 14:59 2019/11/21
     * @Param [tag,request]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/update")
    public ModelAndView update(Tag tag, HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        Tag tagByTagName = tagService.findTagByTagName(tag.getTagName());
        Tag tagByTagId = tagService.findTagByTagId(tag.getTagId());
        if(!tagByTagId.getTagName().equals(tag.getTagName())&&tagByTagName!=null){
            mv.addObject("flag","true");
            mv.addObject("msg","类别名称已存在");
            mv.setViewName("admin/tagManager");
            List<Type> typeList = typeService.findAllTypeName();
            mv.addObject("typeList",typeList);
            return mv;
        }
        Type type = typeService.findTypeByTypeName(tag.getTagTypeName());
        tag.setTagTypeId(type.getTypeId());
        Integer flag = tagService.updateTagByTagID(tag);
        if(flag==1){
            mv.addObject("flag","true");
            mv.addObject("msg","修改成功");
            mv.setViewName("admin/tagManager");
            //日志记录类别修改
            logUtil.setLog(request,"修改了类别名称为："+tagByTagId.getTagName()+"的信息");
            List<Type> typeList = typeService.findAllTypeName();
            mv.addObject("typeList",typeList);
            return mv;
        }else {
            mv.addObject("flag","true");
            mv.addObject("msg","遇到意外错误");
            mv.setViewName("admin/tagManager");
            List<Type> typeList = typeService.findAllTypeName();
            mv.addObject("typeList",typeList);
            return mv;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过类别ID删除类别
     * @Date 16:44 2019/11/21
     * @Param [tagId,request]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/delete")
    public String delete(Integer tagId,HttpServletRequest request){
        Tag tagByTagId = tagService.findTagByTagId(tagId);
        tagService.deleteTagByTagId(tagId);
        //日志记录类别删除
        logUtil.setLog(request,"删除了类别名称为："+tagByTagId.getTagName()+"的信息");
        return "admin/tagManager";
    }

}
