package com.zlk.zlkproject.admin.service;

import com.zlk.zlkproject.entity.Function;

import java.util.List;

public interface FunctionService {
    /**
     * @Author lufengxiang
     * @Description //TODO 根据登陆用户显示不同菜单栏
     * @Date 16:49 2019/11/20
     * @Param [adminName]
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    List<Function> findFunctionByAdminName(String adminName);
}
