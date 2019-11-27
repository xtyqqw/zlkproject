package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.FunctionMapper;
import com.zlk.zlkproject.admin.service.FunctionService;
import com.zlk.zlkproject.entity.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName FunctionServiceImpl
 * @Description: 左侧导航栏业务逻辑类
 * @Author lufengxiang
 * Date 2019/11/20 11:41
 **/
@Service
public class FunctionServiceImpl implements FunctionService {

    @Autowired
    private FunctionMapper functionMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO 根据登陆用户显示不同菜单栏
     * @Date 16:49 2019/11/20
     * @Param [adminName]
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    @Override
    public List<Function> findFunctionByAdminName(String adminName) {
        return functionMapper.findFunctionByAdminName(adminName);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 菜单管理数据接口
     * @Date 10:06 2019/11/25
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    @Override
    public List<Function> functionManager() {
        return functionMapper.functionManager();
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增菜单
     * @Date 17:31 2019/11/25
     * @Param [function]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addFunction(Function function) {
        return functionMapper.addFunction(function);
    }

    @Override
    public Integer updateFunction(Function function) {
        return functionMapper.updateFunction(function);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单编号删除菜单
     * @Date 18:19 2019/11/25
     * @Param [functionId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteFunction(Integer functionId) {
        return functionMapper.deleteFunction(functionId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单ID删除角色权限中间表信息
     * @Date 15:17 2019/11/27
     * @Param [functionId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteFunctionAndRoleByFunctionId(Integer functionId) {
        return functionMapper.deleteFunctionAndRoleByFunctionId(functionId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID查找拥有权限
     * @Date 13:26 2019/11/27
     * @Param [roleId]
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    @Override
    public List<Function> findFunctionByRoleId(String roleId) {
        return functionMapper.findFunctionByRoleId(roleId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单ID查找菜单信息
     * @Date 15:02 2019/11/27
     * @Param [functionId]
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    @Override
    public Function findFunctionByFunctionId(Integer functionId) {
        return functionMapper.findFunctionByFunctionId(functionId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单名称查找菜单信息
     * @Date 15:09 2019/11/27
     * @Param [name]
     * @return com.zlk.zlkproject.entity.Function
     **/
    @Override
    public Function findFunctionByFunctionName(String name) {
        return functionMapper.findFunctionByFunctionName(name);
    }
}
