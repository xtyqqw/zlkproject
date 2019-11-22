package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.TagMapper;
import com.zlk.zlkproject.admin.mapper.TypeMapper;
import com.zlk.zlkproject.admin.service.TypeService;
import com.zlk.zlkproject.admin.util.Pagination;
import com.zlk.zlkproject.entity.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName TypeService
 * @Description: 方向业务逻辑类
 * @Author lufengxiang
 * Date 2019/11/21 14:28
 **/
@Service
public class TypeServiceImpl implements TypeService {

    @Autowired
    private TypeMapper typeMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO 分页查询方向集合
     * @Date 15:22 2019/11/21
     * @Param [pagination]
     * @return java.util.List<com.zlk.zlkproject.entity.Type>
     **/
    @Override
    public List<Type> findTypeByLimit(Pagination pagination) {
        if (pagination.getLimit() == null) {
            pagination.setLimit(10);
        }
        if (pagination.getPage() == null) {
            pagination.setPage(1);
        }
        pagination.setStartPage((pagination.getPage() - 1) * pagination.getLimit());
        return typeMapper.findTypeByLimit(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 查询方向总数(可根据方向名称模糊查询)
     * @Date 15:22 2019/11/21
     * @Param [pagination]
     * @return java.lang.Integer
     **/
    @Override
    public Integer findTotalCountByTypeName(Pagination pagination) {
        return typeMapper.findTotalCountByTypeName(pagination);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向名称查询方向信息
     * @Date 14:29 2019/11/21
     * @Param [typeName]
     * @return com.zlk.zlkproject.entity.Type
     **/
    @Override
    public Type findTypeByTypeName(String typeName) {
        return typeMapper.findTypeByTypeName(typeName);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过typeId查询type信息
     * @Date 9:30 2019/11/22
     * @Param [typeId]
     * @return com.zlk.zlkproject.entity.Type
     **/
    @Override
    public Type findTypeByTypeId(Integer typeId) {
        return typeMapper.findTypeByTypeId(typeId);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 新增方向
     * @Date 16:25 2019/11/21
     * @Param [type]
     * @return java.lang.Integer
     **/
    @Override
    public Integer addType(Type type) {
        return typeMapper.addType(type);
    }
    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向ID修改方向信息
     * @Date 16:28 2019/11/21
     * @Param [type]
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateType(Type type) {
        return typeMapper.updateType(type);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 通过方向ID删除方向信息
     * @Date 16:41 2019/11/21
     * @Param [typeId]
     * @return java.lang.Integer
     **/
    @Override
    public Integer deleteTypeByTypeId(Integer typeId) {
        return typeMapper.deleteTypeByTypeId(typeId);
    }
}
