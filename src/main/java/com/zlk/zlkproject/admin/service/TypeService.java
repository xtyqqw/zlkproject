package com.zlk.zlkproject.admin.service;

import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Type;

import java.util.List;

public interface TypeService {
    
    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询方向集合
     * @Date 15:21 2019/11/21
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Type>
     **/
    List<Type> findTypeByLimit(Pagination pagination);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 查询方向总数(可根据方向名称模糊查询)
     * @Date 15:23 2019/11/21
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    Integer findTotalCountByTypeName(Pagination pagination);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向名称查询方向信息
     * @Date 14:28 2019/11/21
     * @Param [typeName]
     * @return com.zlk.zlkproject.entity.Type
     **/
    Type findTypeByTypeName(String typeName);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 通过typeId查询type信息
     * @Date 9:30 2019/11/22
     * @Param [typeId]
     * @return com.zlk.zlkproject.entity.Type
     **/
    Type findTypeByTypeId(Integer typeId);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 新增方向
     * @Date 16:25 2019/11/21
     * @Param [type]
     * @return java.lang.Integer
     **/
    Integer addType(Type type);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向ID修改方向信息
     * @Date 16:28 2019/11/21
     * @Param [type]
     * @return java.lang.Integer
     **/
    Integer updateType(Type type);

    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向ID删除方向信息
     * @Date 16:41 2019/11/21
     * @Param [typeId]
     * @return java.lang.Integer
     **/
    Integer deleteTypeByTypeId(Integer typeId);
    
    /**
     * @Author lufengxiang
     * @Description //TODO 查询全部方向名称
     * @Date 11:06 2019/11/23
     * @Param []
     * @return java.util.List<com.zlk.zlkproject.entity.Type>
     **/
    List<Type> findAllTypeName();
}
