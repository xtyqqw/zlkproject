package com.zlk.zlkproject.user.signup.service.impl;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.signup.mapper.SignMapper;
import com.zlk.zlkproject.user.signup.service.SignService;
import com.zlk.zlkproject.user.until.MD5Util;
import com.zlk.zlkproject.user.until.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: SignServiceImpl
 * @description: 用户登录注册业务逻辑类
 * @author: xty
 * @create: 2019/11/21 9:22
 **/
@Service
public class SignServiceImpl implements SignService {
    @Autowired
    SignMapper signMapper;
    @Override
    public Integer signup(User user) {
        user.setUserId(UUIDUtil.getUUID());
        String userPwd = MD5Util.md5Encrypt32Lower(user.getUserPwd());
        user.setUserPwd(userPwd);
        return signMapper.signup(user);
    }

    @Override
    public Boolean findUserByPhonenum(String phonenum) {
        User user = signMapper.findUserByPhonenum(phonenum);
        if(user == null){
            return false;
        }else {
            return true;
        }

    }

    @Override
    public User findUserByUserphonenum(String phonenum) {
        return signMapper.findUserByPhonenum(phonenum);
    }

    @Override
    public User findUserByPhonenumAndPwd(User user) {
        System.out.println(user.getUserPwd());
        User user1 = signMapper.findUserByPhonenumAndPwd(user);
        return user1;
    }
}
