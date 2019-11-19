package com.zlk.zlkproject.admin.service;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Dept;

import java.util.List;

public interface DeptService {
    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询部门
     * @Date 14:46 2019/11/19
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Dept>
     **/
    List<Dept> findDeptByLimit(Pagination pagination);

    /**
     * @Author lufengxiang
     * @Description //TODO 查询部门总数(可根据部门名称模糊查询)
     * @Date 14:49 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    Integer findTotalCountByDeptName(Pagination pagination);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 新增部门
     * @Date 15:07 2019/11/19
     * @Param [dept]
     * @return java.lang.Integer
     **/
    Integer addDept(Dept dept);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门名称查询部门信息
     * @Date 15:14 2019/11/19
     * @Param [deptName]
     * @return com.zlk.zlkproject.entity.Dept
     **/
    Dept findDeptByDeptName(String deptName);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门ID修改部门信息
     * @Date 15:28 2019/11/19
     * @Param [dept]
     * @return java.lang.Integer
     **/
    Integer updateDeptByDeptId(Dept dept);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门ID删除部门
     * @Date 15:34 2019/11/19
     * @Param [deptId]
     * @return java.lang.Integer
     **/
    Integer deleteDeptByDeptId(String deptId);
}

