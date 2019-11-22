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
}
