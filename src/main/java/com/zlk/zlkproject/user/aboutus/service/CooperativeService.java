package com.zlk.zlkproject.user.aboutus.service;

import com.zlk.zlkproject.user.entity.Cooperative;
import com.zlk.zlkproject.user.entity.Help;

import java.util.List;

public interface CooperativeService {
    //查询合作企业信息
    List<Cooperative> findAll();
    //查询帮助中心信息
    Help findHelp();
}
