package com.zlk.zlkproject.user.aboutus.service.impl;

import com.zlk.zlkproject.user.aboutus.mapper.CooperativedMapper;
import com.zlk.zlkproject.user.aboutus.service.CooperativeService;
import com.zlk.zlkproject.user.entity.Cooperative;
import com.zlk.zlkproject.user.entity.Help;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: CooperativeServiceImpl
 * @description: 查询合作企业
 * @author: xty
 * @create: 2019/11/25 17:21
 **/
@Service
public class CooperativeServiceImpl implements CooperativeService {
    @Autowired
    CooperativedMapper cooperativedMapper;

    @Override
    public List<Cooperative> findAll() {
        return cooperativedMapper.findAll();
    }

    @Override
    public Help findHelp() {
        return cooperativedMapper.findHelp();
    }
}
