package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.DeptMapper;
import com.zlk.zlkproject.admin.service.DeptService;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName DeptServiceImpl
 * @Description: 部门管理业务逻辑
 * @Author lufengxiang
 * Date 2019/11/19 14:48
 **/
@Service
public class DeptServiceImpl implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询部门
     * @Date 14:49 2019/11/19
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Dept>
     **/
    @Override
    public List<Dept> findDeptByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return deptMapper.findDeptByLimit(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 查询部门总数(可根据部门名称模糊查询)
     * @Date 14:49 2019/11/19
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    @Override
    public Integer findTotalCountByDeptName(Pagination pagination) {
        return deptMapper.findTotalCountByDeptName(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增部门
     * @Date 15:07 2019/11/19
     * @Param [dept]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addDept(Dept dept) {
        return deptMapper.addDept(dept);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门名称查询部门信息
     * @Date 15:11 2019/11/19
     * @Param [deptName]
     * @return com.zlk.zlkproject.entity.Dept
     **/
    @Override
    public Dept findDeptByDeptName(String deptName) {
        return deptMapper.findDeptByDeptName(deptName);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门ID查询部门信息
     * @Date 10:52 2019/11/20
     * @Param [deptId]
     * @return com.zlk.zlkproject.entity.Dept
     **/
    @Override
    public Dept findDeptByDeptId(String deptId) {
        return deptMapper.findDeptByDeptId(deptId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门ID修改部门信息
     * @Date 15:28 2019/11/19
     * @Param [dept]
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateDeptByDeptId(Dept dept) {
        return deptMapper.updateDeptByDeptId(dept);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过部门ID删除部门
     * @Date 15:34 2019/11/19
     * @Param [deptId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteDeptByDeptId(String deptId) {
        return deptMapper.deleteDeptByDeptId(deptId);
    }
}
