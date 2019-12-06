package com.zlk.zlkproject.user.signup.mapper;

import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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
    User findUserByPhonenumAndPwd(User user);
    //修改密码
    Integer changePwd(User user);

    /**
     *  根据用户名模糊查找并分页
     *@method findIdByName
     *@params [userRealname, startPage, limit]
     *@return java.util.List<java.lang.String>
     *@author zhang
     *@time 2019/12/6  15:16
     */
    List<String> findIdByName(String userRealname,Integer startPage,Integer limit);

    /**
     *  根据用户名模糊查询用户数量
     *@method findCountByName
     *@params [userRealname]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/6  15:13
     */
    Integer findCountByName(String userRealname);

}
