package com.zlk.zlkproject.admin.mapper;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Role;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RoleMapper {
    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询角色集合
     * @Date 16:12 2019/11/19
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Role>
     **/
    List<Role> findRoleByLimit(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 查询角色总数(可根据角色名称模糊查询)
     * @Date 16:09 2019/11/19
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
     * @Description //TODO 通过角色名称查询角色信息
     * @Date 16:22 2019/11/19
     * @Param [roleName]
     * @return com.zlk.zlkproject.entity.Role
     **/
    Role findRoleByRoleName(String roleName);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID修改角色信息
     * @Date 16:27 2019/11/19
     * @Param [role]
     * @return java.lang.Integer
     **/
    Integer updateRoleByRoleId(Role role);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 通过角色ID删除角色
     * @Date 16:32 2019/11/19
     * @Param [roleId]
     * @return java.lang.Integer
     **/
    Integer deleteRoleByRoleId(String roleId);
}
