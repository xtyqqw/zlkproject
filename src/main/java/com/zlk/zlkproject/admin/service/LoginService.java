package com.zlk.zlkproject.admin.service;

import com.zlk.zlkproject.entity.Admin;

public interface LoginService {
    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户名查找管理员
     * @Date 10:06 2019/11/19
     * @Param [adminName]
     * @return com.zlk.zlkproject.entity.Admin
     **/
    Admin findAdminByAdminName(String adminName);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 查找浏览量
     * @Date 16:16 2019/12/3
     * @Param []
     * @return java.lang.Integer
     **/
    Integer findVisitNumber();
    
    /**
     * @Author lufengxiang
     * @Description //TODO 每次被访问访问量+1
     * @Date 16:28 2019/12/3
     * @Param []
     * @return java.lang.Integer
     **/
    Integer updateVisitNumber();
}
