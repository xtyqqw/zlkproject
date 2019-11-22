package com.zlk.zlkproject.admin.util;

import com.zlk.zlkproject.admin.service.LogService;
import com.zlk.zlkproject.entity.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Enumeration;

/**
 * @ClassName LogUtil
 * @Description: 存储日志信息工具类
 * @Author lufengxiang
 * Date 2019/11/21 17:16
 **/
@Component
public class LogUtil {

    @Autowired
    private LogService logService;

    public Integer setLog(HttpServletRequest request,String description){
        Log log=new Log();
        //获取IP
        log.setIp(NetworkUtil.getIpAddress(request));
        String agent = request.getHeader("user-agent");//获取版本
        //判断agent的浏览器版本
        if(agent.toLowerCase().contains("chrome")){
            //谷歌
            log.setType("谷歌浏览器");
        }else if(agent.toLowerCase().contains("firefox")){
            //火狐
            log.setType("火狐浏览器");
        }else {
            log.setType("其他浏览器");
        }
        String  loginName = (String) request.getSession().getAttribute("loginName");
        log.setName(loginName);
        log.setDescription(description);
        log.setTime(new Date());
        return logService.addLog(log);
    }
}
