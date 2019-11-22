package com.zlk.zlkproject.admin.mapper;

import com.zlk.zlkproject.entity.Function;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FunctionMapper {
    /**
     * @Author lufengxiang
     * @Description //TODO 根据登陆用户显示不同菜单栏
     * @Date 15:51 2019/11/20
     * @Param [adminName]
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    List<Function> findFunctionByAdminName(String adminName);
}