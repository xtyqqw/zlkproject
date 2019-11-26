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

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单编号删除菜单
     * @Date 18:19 2019/11/25
     * @Param [functionId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteFunction(String functionId) {
        return functionMapper.deleteFunction(functionId);
    }
}
