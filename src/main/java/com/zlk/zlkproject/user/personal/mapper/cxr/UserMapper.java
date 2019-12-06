package com.zlk.zlkproject.user.personal.mapper.cxr;

import com.zlk.zlkproject.user.entity.CxrPaging;
import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


/**
 * @author 崔新睿
 * @data 2019/11/19 - 11:07
 */
@Mapper
public interface UserMapper {
    /**
     * 分页查询所有用户信息
     * @param cxrPaging
     * @return
     */
    public List<User> findUserByLimit(CxrPaging cxrPaging);

    /**
     * 查找后台用户总数(可根据用户名模糊查询，分页显示)
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
     * 根据userID查询单个信息
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
     * 根据userID查询单个信息
     * @param userId
     * @return
     */
    public List<User> selectByUserId(String userId);



}
