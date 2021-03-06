package com.zlk.zlkproject.course.tag.controller;


import com.zlk.zlkproject.course.tag.service.TagKeService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName tagController
 * @Description:
 * @Author LuanKe
 * Date 2019/12/6 16:56
 **/
@Controller
@RequestMapping(value="/tagKe")
public class TagKeController {
    @Autowired
    private TagKeService tagKeService;

    @RequestMapping(value = "/findTagList")
    @ResponseBody
    public Map<String, Object> findTagList(Tag tag,Integer page,Integer limit) throws Exception {
        List<Tag> tagList = tagKeService.findTagList(tag,page,limit);
        Map<String, Object> map = new HashMap<>();
        map.put("tagList", tagList);
        return map;
    }

    /**
     *  根据typeId查找全部tag
     *@method findTagByTypeId
     *@params [typeId]
     *@return java.util.Map<java.lang.String,java.lang.Object>
     *@author zhang
     *@time 2019/12/11  16:12
     */
    @RequestMapping(value = "/findTagByTypeId")
    @ResponseBody
    public Map<String, Object> findTagByTypeId(Integer typeId) throws Exception {
        List<Tag> tagList = tagKeService.findTagByTypeId(typeId);
        Map<String, Object> map = new HashMap<>();
        map.put("tagList", tagList);
        return map;
    }
}