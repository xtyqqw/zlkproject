package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.AdminMapper;
import com.zlk.zlkproject.admin.service.AdminService;
import com.zlk.zlkproject.admin.service.RoleService;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Admin;
import com.zlk.zlkproject.entity.Role;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
    @Autowired
    private RoleService roleService;

    /**
     * @Author lufengxiang
     * @Description //TODO 分页查找后台用户
     * @Date 10:41 2019/11/19
     * @Param [pagination]
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
     * @Param [roleId]
     * @return java.util.List<com.zlk.zlkproject.entity.Admin>
     **/
    @Override
    public List<Admin> findAdminByRoleId(String roleId) {
        return adminMapper.findAdminByRoleId(roleId);
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
    @Transactional
    public Integer addAdmin(Admin admin) {
        //添加用户
        Integer flag = adminMapper.addAdmin(admin);
        //添加用户角色中间表记录
        Role roleByRoleName = roleService.findRoleByRoleName(admin.getAdminRole());
        Integer flag1 = adminMapper.addAdminAndRole(admin.getAdminId(), roleByRoleName.getRoleId());
        if(flag>0&&flag1>0){
            return 1;
        }else {
            return 0;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID修改用户信息
     * @Date 13:16 2019/11/19
     * @Param [admin]
     * @return java.lang.Integer
     **/
    @Override
    @Transactional
    public Integer updateAdminByAdminId(Admin admin) {
        //修改用户表信息
        Integer flag = adminMapper.updateAdminByAdminId(admin);
        //修改用户角色中间表信息
        Role roleByRoleName = roleService.findRoleByRoleName(admin.getAdminRole());
        Integer flag1 = adminMapper.updateAdminAndRoleByAdminId(admin.getAdminId(), roleByRoleName.getRoleId());
        if (flag>0&&flag1>0){
            return 1;
        }else {
            return 0;
        }
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户ID删除用户
     * @Date 13:30 2019/11/19
     * @Param [adminId]
     * @return java.lang.Integer
     **/
    @Override
    @Transactional
    public Integer deleteAdminByAdminId(String adminId) {
        //删除用户表记录
        Integer flag = adminMapper.deleteAdminByAdminId(adminId);
        //删除用户及用户角色中间表记录
        Integer flag1 = adminMapper.deleteAdminAndRoleByAdminId(adminId);
        if (flag>0){
            return 1;
        }else {
            return 0;
        }
    }
}
