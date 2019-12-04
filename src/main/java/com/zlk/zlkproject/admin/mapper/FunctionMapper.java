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

    /**
     * @Author lufengxiang
     * @Description //TODO 菜单管理数据接口
     * @Date 10:05 2019/11/25
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    List<Function> functionManager();

    /**
     * @Author lufengxiang
     * @Description //TODO 新增菜单
     * @Date 17:30 2019/11/25
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
     * @Date 18:18 2019/11/25
     * @Param [functionId]
     * @return java.lang.Integer
     **/
    Integer deleteFunction(Integer functionId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单ID删除角色权限中间表信息
     * @Date 15:16 2019/11/27
     * @Param [functionId]
     * @return java.lang.Integer
     **/
    Integer deleteFunctionAndRoleByFunctionId(Integer functionId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID查找拥有权限
     * @Date 13:25 2019/11/27
     * @Param [roleId]
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    List<Function> findFunctionByRoleId(String roleId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单ID查找菜单信息
     * @Date 15:00 2019/11/27
     * @Param [functionId]
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    Function findFunctionByFunctionId(Integer functionId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过菜单名称查找菜单信息
     * @Date 15:09 2019/11/27
     * @Param [name]
     * @return com.zlk.zlkproject.entity.Function
     **/
    Function findFunctionByFunctionName(String name);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过URL查询菜单信息
     * @Date 9:48 2019/11/29
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Function>
     **/
    List<Function> findFunctionByUrl();

    /**
     * @Author lufengxiang
     * @Description //TODO 通过ID查询父菜单信息
     * @Date 14:22 2019/11/29
     * @Param [id]
     * @return com.zlk.zlkproject.entity.Function
     **/
    Function findParentFunctionByFunctionId(Integer id);
}
