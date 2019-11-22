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
}
