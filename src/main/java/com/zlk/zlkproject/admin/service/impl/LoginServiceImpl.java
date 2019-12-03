package com.zlk.zlkproject.admin.service.impl;

import com.zlk.zlkproject.admin.mapper.LoginMapper;
import com.zlk.zlkproject.admin.service.LoginService;
import com.zlk.zlkproject.entity.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName LoginServiceImpl
 * @Description: 登陆业务逻辑
 * @Author lufengxiang
 * Date 2019/11/19 10:04
 **/
@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    /**
     * @Author lufengxiang
     * @Description //TODO 通过用户名查找管理员
     * @Date 10:09 2019/11/19
     * @Param [adminName]
     * @return com.zlk.zlkproject.entity.Admin
     **/
    @Override
    public Admin findAdminByAdminName(String adminName) {
        return loginMapper.findAdminByAdminName(adminName);
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 查找浏览量
     * @Date 16:16 2019/12/3
     * @Param []
     * @return java.lang.Integer
     **/
    @Override
    public Integer findVisitNumber() {
        return loginMapper.findVisitNumber();
    }

    /**
     * @Author lufengxiang
     * @Description //TODO 每次被访问访问量+1
     * @Date 16:30 2019/12/3
     * @Param []
     * @return java.lang.Integer
     **/
    @Override
    public Integer updateVisitNumber() {
        return loginMapper.updateVisitNumber();
    }
}
