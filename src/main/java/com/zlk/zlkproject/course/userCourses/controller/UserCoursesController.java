package com.zlk.zlkproject.course.userCourses.controller;

import com.zlk.zlkproject.course.userCourses.service.UserCoursesService;
import com.zlk.zlkproject.entity.UserCourses;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * (UserCourses)表控制层
 *
 * @author makejava
 * @since 2019-11-26 16:14:59
 */
@RestController
@RequestMapping("userCourses")
public class UserCoursesController {
    /**
     * 服务对象
     */
    @Resource
    private UserCoursesService userCoursesService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public UserCourses selectOne(String id) {
        return this.userCoursesService.queryById(id);
    }

}