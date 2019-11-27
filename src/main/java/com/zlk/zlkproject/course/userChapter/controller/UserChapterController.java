package com.zlk.zlkproject.course.userChapter.controller;

import com.zlk.zlkproject.course.userChapter.service.UserChapterService;
import com.zlk.zlkproject.entity.UserChapter;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * (UserChapter)表控制层
 *
 * @author makejava
 * @since 2019-11-26 16:14:40
 */
@RestController
@RequestMapping("userChapter")
public class UserChapterController {
    /**
     * 服务对象
     */
    @Resource
    private UserChapterService userChapterService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @GetMapping("selectOne")
    public UserChapter selectOne(Integer id) {
        return this.userChapterService.queryById(id);
    }

}