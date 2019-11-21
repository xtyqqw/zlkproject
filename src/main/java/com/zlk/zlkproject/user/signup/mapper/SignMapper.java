package com.zlk.zlkproject.user.signup.mapper;

import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: SignMapper
 * @description: 登陆注册接口
 * @author: xty
 * @create: 2019/11/19 20:39
 **/
@Mapper
public interface SignMapper {
    /**
     * 用户注册方法
     * 参数：user对象
     * 返回值成功时为 1
     * */
    Integer signup(User user);
    User findUserByPhonenum(String phonenum);


}
