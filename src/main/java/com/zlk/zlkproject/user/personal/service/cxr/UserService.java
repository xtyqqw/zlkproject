package com.zlk.zlkproject.user.personal.service.cxr;

import com.zlk.zlkproject.user.entity.CxrPaging;
import com.zlk.zlkproject.entity.User;

import java.util.List;

/**
 * @author 崔新睿
 * service层调用mapper层的方法
 * @data 2019/11/19 - 14:20
 */
public interface UserService {
    /**
     * 分页查询用户信息
     * @param cxrPaging
     * @return
     */
    public List<User> findUserByLimit(CxrPaging cxrPaging);

    /**
     * 查找后台用户总数(可根据用户名模糊查询，分页)
     * @param cxrPaging
     * @return
     */
    public  Integer findTotalCountByName(CxrPaging cxrPaging);

    /**
     * 修改user方法
     * @param user
     * @return
     */
    public int updateUser(User user);



    /**
     * 根据userID查询单个对象信息
     * @param userId
     * @return
     */
    public User selectUserById(String userId);



    /**
     * 根据ID进行删除
     * @param userId
     * @return
     */
    public int deleteByUserId(String userId);

    /**
     * 根据userID查询单个对象信息集合
     * @param userId
     * @return
     */
    public List<User> selectByUserId(String userId);
//    /***
//     * 后台修改用户信息方法
//     * @param user
//     * @return
//     */
//    public int updatesUser(User user);

}
