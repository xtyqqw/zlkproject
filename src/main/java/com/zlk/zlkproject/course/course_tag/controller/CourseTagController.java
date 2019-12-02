package com.zlk.zlkproject.course.course_tag.controller;

import com.zlk.zlkproject.course.course_tag.service.CourseTagService;
import com.zlk.zlkproject.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @program: zlkproject
 * @description: 标签控制器
 * @author: zyx
 * @create: 2019-11-27 09:23
 */
@Controller
@RequestMapping(value = "/courseTag")
public class CourseTagController {

    @Autowired
    private CourseTagService courseTagService;

    @RequestMapping(value = "/findAll")
    @ResponseBody
    public Map<String,Object> findAll() throws Exception{
        List<Tag> tagList = courseTagService.findAllTags();
        Map<String,Object> map = new HashMap<>();
        map.put("tagList",tagList);
        return map;
    }
}
