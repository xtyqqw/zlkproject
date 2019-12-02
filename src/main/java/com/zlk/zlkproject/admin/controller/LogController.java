package com.zlk.zlkproject.admin.controller;

import com.zlk.zlkproject.admin.service.LogService;
import com.zlk.zlkproject.admin.util.LogUtil;
import com.zlk.zlkproject.admin.util.NetworkUtil;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Log;
import org.apache.logging.log4j.Logger;
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
 * @ClassName LogController
 * @Description: 日志管理Controller
 * @Author lufengxiang
 * Date 2019/11/19 19:35
 **/
@Controller
@RequestMapping(value = "/log")
public class LogController {

    @Autowired
    private LogService logService;

    /**
     * @Author lufengxiang
     * @Description //TODO 跳转到日志管理页面
     * @Date 20:15 2019/11/19
     * @Param [condition]
     * @return org.springframework.web.servlet.ModelAndView
     **/
    @RequestMapping(value = "/toLogManager")
    public ModelAndView toLogManager(String condition){
        ModelAndView mv=new ModelAndView();
        if(condition!=null && condition!= "") {
            mv.addObject("msg",condition);
            mv.addObject("condition", condition);
            mv.addObject("flag", "true");
        }
        mv.setViewName("admin/logManager");
        return mv;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 日志管理数据接口
     * @Date 20:15 2019/11/19
     * @Param [pagination]
     * @return java.util.Map<java.lang.String,java.lang.Object>
     **/
    @RequestMapping(value = "/logManager")
    @ResponseBody
    public Map<String,Object> logManager(Pagination pagination){
        Map<String,Object> map=new HashMap<>();
        List<Log> logList = logService.findLogByLimit(pagination);
        Integer count = logService.findTotalCountByName(pagination);
        map.put("data",logList);
        map.put("count",count);
        map.put("code","0");
        return map;
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 删除日志
     * @Date 10:49 2019/11/20
     * @Param [logId]
     * @return java.lang.String
     **/
    @RequestMapping(value = "/delete")
    public String delete(String logId){
        Integer flag = logService.deleteLogByLogId(logId);
        return "admin/logManager";
    }

}
