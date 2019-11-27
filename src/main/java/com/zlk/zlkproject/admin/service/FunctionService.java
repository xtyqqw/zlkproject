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
    
    /**
     * @Author lufengxiang
     * @Description //TODO 菜单管理数据接口
     * @Date 10:06 2019/11/25
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    List<Function> functionManager();
    
    /**
     * @Author lufengxiang
     * @Description //TODO 新增菜单
     * @Date 17:31 2019/11/25
     * @Param [function]
     * @return java.lang.Integer
     **/
    Integer addFunction(Function function);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单编号修改菜单信息
     * @Date 11:25 2019/11/26
     * @Param [function]
     * @return java.lang.Integer
     **/
    Integer updateFunction(Function function);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单编号删除菜单
     * @Date 18:19 2019/11/25
     * @Param [functionId]
     * @return java.lang.Integer
     **/
    Integer deleteFunction(String functionId);
}
