package com.zlk.zlkproject.course.type.service.impl;

import com.zlk.zlkproject.course.type.mapper.TypeKeMapper;
import com.zlk.zlkproject.course.type.service.TypeKeService;
import com.zlk.zlkproject.entity.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: zlkproject
 * @description: type业务实现类
 * @author: zyx
 * @create: 2019-12-11 15:30
 */
@Service
public class TypeKeServiceImpl implements TypeKeService {
    @Autowired
    private TypeKeMapper typeKeMapper;

    @Override
    public List<Type> selectAll() {
        return typeKeMapper.selectAll();
    }
}
