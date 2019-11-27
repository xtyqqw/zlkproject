package com.zlk.zlkproject.user.aboutus.mapper;

import com.zlk.zlkproject.entity.Friends;
import com.zlk.zlkproject.user.entity.Cooperative;
import com.zlk.zlkproject.user.entity.Help;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CooperativedMapper {
    //查询合作企业信息
    List<Cooperative> findAll();
    //查询帮助中心信息
    Help findHelp();
    //查询友情链接
    List<Friends> findFriendsUrl();
}
