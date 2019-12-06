package com.zlk.zlkproject.course.userSection.controller;

import com.zlk.zlkproject.course.userSection.service.UserSectionService;
import com.zlk.zlkproject.entity.UserSection;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * (UserSection)表控制层
 *
 * @author makejava
 * @since 2019-11-26 17:02:06
 */
@RestController
@RequestMapping("userSection")
public class UserSectionController {
    /**
     * 服务对象
     */
    @Resource
    private UserSectionService userSectionService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public UserSection selectOne(String id) {
        return this.userSectionService.queryById(id);
    }

}