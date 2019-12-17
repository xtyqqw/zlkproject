package com.zlk.zlkproject.user.personal.service.impl.cxr;

import com.zlk.zlkproject.user.entity.CxrPaging;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.mapper.cxr.UserMapper;
import com.zlk.zlkproject.user.personal.service.cxr.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 崔新睿
 * serviceImpl是service方法的实现层
 * @data 2019/11/19 - 14:21
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;

    /**
     * 查询所有方法（包括模糊查询）
     *
     * @param cxrPaging
     * @return
     */
    @Override
    public List<User> findUserByLimit(CxrPaging cxrPaging) {
        //   定义起始页，和条数
        if (cxrPaging.getLimit() == null) {
            cxrPaging.setLimit(10);
        }
        if (cxrPaging.getPage() == null) {
            cxrPaging.setPage(1);
        }
        cxrPaging.setStartPage((cxrPaging.getPage() - 1) * cxrPaging.getLimit());
        //调用查询方法
        return userMapper.findUserByLimit(cxrPaging);
    }

    /**
     * 查询总数方法
     *
     * @param cxrPaging
     * @return
     */
    @Override
    public Integer findTotalCountByName(CxrPaging cxrPaging) {
        return userMapper.findTotalCountByName(cxrPaging);
    }

    /**
     * 修改方法
     *
     * @param user
     * @return
     */
    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    /**
     * 通过ID查询对象
     *
     * @param userId
     * @return
     */
    @Override
    public User selectUserById(String userId) {
        return userMapper.selectUserById(userId);
    }

    /**
     * 通过ID删除方法
     *
     * @param userId
     * @return
     */
    @Override
    public int deleteByUserId(String userId) {
        return userMapper.deleteByUserId(userId);
    }

    /**
     * 通过ID查询对象集合
     * @param userId
     * @return
     */

    @Override
    public List<User> selectByUserId(String userId) {
        return userMapper.selectByUserId(userId);
    }

//    @Override
//    public int updatesUser(User user) {
//        return userMapper.updateUser(user);
//    }
}