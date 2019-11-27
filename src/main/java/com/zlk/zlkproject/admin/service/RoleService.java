package com.zlk.zlkproject.admin.service;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Role;

import java.util.List;

public interface RoleService {
    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询角色集合
     * @Date 16:05 2019/11/19
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Role>
     **/
    List<Role> findRoleByLimit(Pagination pagination);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 查询角色总数(可根据角色名称模糊查询)
     * @Date 16:06 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    Integer findTotalCountByRoleName(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 新增角色
     * @Date 16:20 2019/11/19
     * @Param [role]
     * @return java.lang.Integer
     **/
    Integer addRole(Role role);

    /**
     * @Author lufengxiang
     * @Description //TODO 角色授权
     * @Date 10:55 2019/11/27
     * @Param [roleId]
     * @return java.lang.Integer
     **/
    Integer addRoleAndFunction(String roleId,Integer functionId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID查询角色信息
     * @Date 9:21 2019/11/20
     * @Param [roleId]
     * @return com.zlk.zlkproject.entity.Role
     **/
    Role findRoleByRoleId(String roleId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色名称查询角色信息
     * @Date 16:21 2019/11/19
     * @Param [roleName]
     * @return com.zlk.zlkproject.entity.Role
     **/
    Role findRoleByRoleName(String roleName);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID修改角色信息
     * @Date 16:26 2019/11/19
     * @Param [role]
     * @return java.lang.Integer
     **/
    Integer updateRoleByRoleId(Role role);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID删除角色
     * @Date 16:31 2019/11/19
     * @Param [roleId]
     * @return java.lang.Integer
     **/
    Integer deleteRoleByRoleId(String roleId);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 删除角色一并删除其授权
     * @Date 11:45 2019/11/27
     * @Param [roleId]
     * @return java.lang.Integer
     **/
    Integer deleteRoleAndFunctionByRoleId(String roleId);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 查询全部角色名
     * @Date 10:22 2019/11/22
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Role>
     **/
    List<Role> findRoleName();
}
