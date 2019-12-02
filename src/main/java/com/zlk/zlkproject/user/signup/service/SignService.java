package com.zlk.zlkproject.user.signup.service;

import com.zlk.zlkproject.entity.User;
import org.springframework.stereotype.Service;

/**
 *
 * */

public interface SignService {
    //用户注册接口
    Integer signup(User user);
    /**
     * 通过phonenum查找用户
     * 找到返回true 没找到返回false
     * */
    Boolean findUserByPhonenum(String phonenum);
    User findUserByUserphonenum(String phonenum);
    User findUserByPhonenumAndPwd(User user);
    //修改密码
    Integer changePwd(User user);
}
