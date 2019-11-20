package com.zlk.zlkproject.admin.service;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Admin;

import java.util.List;

public interface AdminService {
    /**
     * @Author lufengxiang
     * @Description //TODO 分页查找后台用户
     * @Date 10:41 2019/11/19
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Admin>
     **/
    List<Admin> findAdminByLimit(Pagination pagination);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 查找后台用户总数(可根据用户名模糊查询)
     * @Date 10:53 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    Integer findTotalCountByAdminName(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 查找有该角色的用户集合
     * @Date 19:09 2019/11/19
     * @Param [roleName]
     * @return java.util.List<com.zlk.zlkproject.entity.Admin>
     **/
    List<Admin> findAdminByRoleName(String roleName);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过后台用户ID查询用户信息
     * @Date 9:11 2019/11/20
     * @Param [adminId]
     * @return com.zlk.zlkproject.entity.Admin
     **/
    Admin findAdminByAdminId(String adminId);

    /**
     * @Author lufengxiang
     * @Description //TODO 新增后台用户
     * @Date 12:57 2019/11/19
     * @Param [admin]
     * @return java.lang.Integer
     **/
    Integer addAdmin(Admin admin);

    /**
     * @Author lufengxiang
     * @Description //TODO 新增用户关联对应的角色
     * @Date 16:47 2019/11/19
     * @Param [adminId, roleId]
     * @return java.lang.Integer
     **/
    Integer addAdminAndRole(String adminsId,String rolesId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID修改用户信息
     * @Date 13:23 2019/11/19
     * @Param [admin]
     * @return java.lang.Integer
     **/
    Integer updateAdminByAdminId(Admin admin);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID修改其关联角色
     * @Date 17:07 2019/11/19
     * @Param [adminsId, rolesId]
     * @return java.lang.Integer
     **/
    Integer updateAdminAndRoleByAdminId(String adminsId,String rolesId);

    /**
     * @Author lufengxiang
     * @Description //TODO 修改角色名称一并修改拥有该角色的用户信息
     * @Date 9:40 2019/11/20
     * @Param [roleName1]
     * @return java.lang.Integer
     **/
    Integer updateAdminByRoleName(String roleName1,String roleName2);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID删除用户
     * @Date 14:47 2019/11/19
     * @Param [adminId]
     * @return java.lang.Integer
     **/
    Integer deleteAdminByAdminId(String adminId);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID删除与其角色关联
     * @Date 17:03 2019/11/19
     * @Param [adminId]
     * @return java.lang.Integer
     **/
    Integer deleteAdminAndRoleByAdminId(String adminsId);
}
