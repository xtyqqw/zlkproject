package com.zlk.zlkproject.course.kechengxiangqingtest.controller;

import com.zlk.zlkproject.course.kechengxiangqingtest.entity.Kechengxiaojei;
import com.zlk.zlkproject.course.kechengxiangqingtest.service.KechengxiaojeiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * (Kechengxiaojei)表控制层
 *
 * @author makejava
 * @since 2019-11-23 10:18:42
 */
@RestController
@RequestMapping("kechengxiaojei")
public class KechengxiaojeiController {
    /**
     * 服务对象
     */
    @Autowired
    private KechengxiaojeiService kechengxiaojeiService;

    /**
     * 通过主键查询单条数据
     *
     * @param id 主键
     * @return 单条数据
     */
    @RequestMapping("selectOne")
    public Kechengxiaojei selectOne(Integer id) {
        return this.kechengxiaojeiService.queryById(id);
    }

    /**
     * 查询全部并分页
     * @param page
     * @return
     */
    @RequestMapping("selkechengxiangqing")
    public Map selkechengxiangqing(int page, int limit){
        int yei = kechengxiaojeiService.queryCount()/limit;
        if (kechengxiaojeiService.queryCount()%limit!=0){
            yei++;
        }
        Map map=new HashMap();
        map.put("yeishu",yei);
        map.put("xianqingList",kechengxiaojeiService.queryAllByLimit(page,limit));
        return map;
    }
}