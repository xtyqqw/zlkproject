package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.FunctionMapper;
import com.zlk.zlkproject.admin.service.FunctionService;
import com.zlk.zlkproject.entity.Function;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
     * @Description //TODO 查找子级菜单数
     * @Date 9:57 2019/12/5
     * @Param [id]
     * @return java.lang.Integer
     **/
    @Override
    public Integer findChildrenNumber(Integer id) {
        return functionMapper.findChildrenNumber(id);
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

    /**
     * @Author lufengxiang
     * @Description //TODO 修改菜单
     * @Date 10:14 2019/11/28
     * @Param [function]
     * @return java.lang.Integer
     **/
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
    @Transactional
    public Integer deleteFunction(Integer functionId) {
        Integer flag = functionMapper.deleteFunction(functionId);
        Integer flag1 = functionMapper.deleteFunctionAndRoleByFunctionId(functionId);
        if(flag>0&&flag1>0){
            return 1;
        }else {
            return 0;
        }
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

    /**
     * @Author lufengxiang
     * @Description //TODO 通过URL查询菜单信息
     * @Date 9:48 2019/11/29
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    @Override
    public List<Function> findFunctionByUrl() {
        return functionMapper.findFunctionByUrl();
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过ID查询父菜单信息
     * @Date 14:22 2019/11/29
     * @Param [id]
     * @return com.zlk.zlkproject.entity.Function
     **/
    @Override
    public Function findParentFunctionByFunctionId(Integer id) {
        return functionMapper.findParentFunctionByFunctionId(id);
    }
}
