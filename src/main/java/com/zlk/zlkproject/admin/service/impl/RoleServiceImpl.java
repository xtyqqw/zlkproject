package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.RoleMapper;
import com.zlk.zlkproject.admin.service.RoleService;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName RoleServiceImpl
 * @Description: 角色管理业务逻辑类
 * @Author lufengxiang
 * Date 2019/11/19 16:06
 **/
@Service
public class RoleServiceImpl implements RoleService {
    
    @Autowired
    private RoleMapper roleMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询角色集合
     * @Date 16:07 2019/11/19
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Role>
     **/
    @Override
    public List<Role> findRoleByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return roleMapper.findRoleByLimit(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 查询角色总数(可根据角色名称模糊查询)
     * @Date 16:08 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    @Override
    public Integer findTotalCountByRoleName(Pagination pagination) {
        return roleMapper.findTotalCountByRoleName(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增角色
     * @Date 16:24 2019/11/19
     * @Param [role]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addRole(Role role) {
        return roleMapper.addRole(role);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 角色授权
     * @Date 11:18 2019/11/27
     * @Param [roleId, functionIdList]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addRoleAndFunction(String roleId, List<Integer> functionId) {
        return roleMapper.addRoleAndFunction(roleId,functionId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID查询角色信息
     * @Date 9:22 2019/11/20
     * @Param [roleId]
     * @return com.zlk.zlkproject.entity.Role
     **/
    @Override
    public Role findRoleByRoleId(String roleId) {
        return roleMapper.findRoleByRoleId(roleId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色名查询角色信息
     * @Date 16:24 2019/11/19
     * @Param [roleName]
     * @return com.zlk.zlkproject.entity.Role
     **/
    @Override
    public Role findRoleByRoleName(String roleName) {
        return roleMapper.findRoleByRoleName(roleName);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID修改角色信息
     * @Date 16:27 2019/11/19
     * @Param [role]
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateRoleByRoleId(Role role) {
        return roleMapper.updateRoleByRoleId(role);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID删除角色
     * @Date 16:32 2019/11/19
     * @Param [roleId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteRoleByRoleId(String roleId) {
        return roleMapper.deleteRoleByRoleId(roleId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 删除角色一并删除其授权
     * @Date 11:45 2019/11/27
     * @Param [roleId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteRoleAndFunctionByRoleId(String roleId) {
        return roleMapper.deleteRoleAndFunctionByRoleId(roleId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 查询全部角色名
     * @Date 10:22 2019/11/22
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Role>
     **/
    @Override
    public List<Role> findRoleName() {
        return roleMapper.findRoleName();
    }
}
