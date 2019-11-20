package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.AdminMapper;
import com.zlk.zlkproject.admin.service.AdminService;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName AdminServiceImpl
 * @Description: 后台用户管理业务逻辑
 * @Author lufengxiang
 * Date 2019/11/19 10:39
 **/
@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO 分页查找后台用户
     * @Date 10:41 2019/11/19
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Admin>
     **/
    @Override
    public List<Admin> findAdminByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return adminMapper.findAdminByLimit(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 查找后台用户总数(可根据用户名模糊查询)
     * @Date 10:53 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    @Override
    public Integer findTotalCountByAdminName(Pagination pagination) {
        return adminMapper.findTotalCountByAdminName(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户所属角色查询用户
     * @Date 9:15 2019/11/20
     * @Param [roleName]
     * @return java.util.List<com.zlk.zlkproject.entity.Admin>
     **/
    @Override
    public List<Admin> findAdminByRoleName(String roleName) {
        return adminMapper.findAdminByRoleName(roleName);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过后台用户ID查询用户
     * @Date 9:21 2019/11/20
     * @Param [adminId]
     * @return com.zlk.zlkproject.entity.Admin
     **/
    @Override
    public Admin findAdminByAdminId(String adminId) {
        return adminMapper.findAdminByAdminId(adminId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增后台用户
     * @Date 12:56 2019/11/19
     * @Param [admin]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addAdmin(Admin admin) {
        return adminMapper.addAdmin(admin);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增用户关联对应的角色
     * @Date 16:57 2019/11/19
     * @Param [adminsId, rolesId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addAdminAndRole(String adminsId, String rolesId) {
        return adminMapper.addAdminAndRole(adminsId, rolesId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID修改用户信息
     * @Date 13:16 2019/11/19
     * @Param [admin]
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateAdminByAdminId(Admin admin) {
        return adminMapper.updateAdminByAdminId(admin);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID修改其关联角色
     * @Date 17:09 2019/11/19
     * @Param [adminsId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateAdminAndRoleByAdminId(String adminsId,String rolesId) {
        return adminMapper.updateAdminAndRoleByAdminId(adminsId,rolesId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 修改角色名称一并修改拥有该角色的用户信息
     * @Date 10:32 2019/11/20
     * @Param [roleName1, roleName2]
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateAdminByRoleName(String roleName1, String roleName2) {
        return adminMapper.updateAdminByRoleName(roleName1, roleName2);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID删除用户
     * @Date 13:30 2019/11/19
     * @Param [adminId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteAdminByAdminId(String adminId) {
        return adminMapper.deleteAdminByAdminId(adminId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID修改用户信息
     * @Date 17:04 2019/11/19
     * @Param [adminsId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteAdminAndRoleByAdminId(String adminsId) {
        return adminMapper.deleteAdminAndRoleByAdminId(adminsId);
    }
}
