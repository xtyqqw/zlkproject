package com.zlk.zlkproject.user.index.service.serviceimpl;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.index.mapper.IndexMapper;
import com.zlk.zlkproject.user.index.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName： IndexServiceImpl
 * @Description： index service接口实现类
 * @Author： yzh
 * @Date： 2019/11/21 19:28
 */
@Service
public class IndexServiceImpl implements IndexService {
    @Autowired(required = false)
    private IndexMapper indexMapper;
    /**
     * 查询所有课程
     * @return List<Courses>
     */
    @Override
    public List<Courses> findCoursesAll() {
        return indexMapper.findCoursesAll();
    }
    /**
     * 按照学习总时长从多到少查询用户
     * @return List<User>
     */
    @Override
    public List<User> findUsersByAllTime() {
        return indexMapper.findUsersByAllTime();
    }
    /**
     * 根据ID查询用户
     * @param userId
     * @return User
     */
    @Override
    public User findUsersById(String userId) {
        return indexMapper.findUsersById(userId);
    }
    /**
     * 根据ID查询学习时长排序后用户的排名
     * @param userId
     * @return Integer
     */
    @Override
    public Integer findUserRankById(String userId) {
        return indexMapper.findUserRankById(userId);
    }
    /**
     * 查询用户总数
     * @return Integer
     */
    @Override
    public Integer findUserCount() {
        return indexMapper.findUserCount();
    }
}
