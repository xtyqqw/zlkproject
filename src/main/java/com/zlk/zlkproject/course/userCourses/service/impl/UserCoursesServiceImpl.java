package com.zlk.zlkproject.course.userCourses.service.impl;

import com.zlk.zlkproject.course.userCourses.mapper.UserCoursesMapper;
import com.zlk.zlkproject.course.userCourses.service.UserCoursesService;
import com.zlk.zlkproject.entity.UserCourses;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (UserCourses)表服务实现类
 *
 * @author makejava
 * @since 2019-11-26 16:14:58
 */
@Service("userCoursesService")
public class UserCoursesServiceImpl implements UserCoursesService {
    @Autowired
    private UserCoursesMapper userCoursesMapper;

    @Override
    public List<UserCourses> queryAll(UserCourses userCourses) {
        return userCoursesMapper.queryAll(userCourses);
    }

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    @Override
    public UserCourses queryById(Integer userId) {
        return this.userCoursesMapper.queryById(userId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<UserCourses> queryAllByLimit(int offset, int limit) {
        return this.userCoursesMapper.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param userCourses 实例对象
     * @return 实例对象
     */
    @Override
    public UserCourses insert(UserCourses userCourses) {
        this.userCoursesMapper.insert(userCourses);
        return userCourses;
    }

    /**
     * 修改数据
     *
     * @param userCourses 实例对象
     * @return 实例对象
     */
    @Override
    public UserCourses update(UserCourses userCourses) {
        this.userCoursesMapper.update(userCourses);
        return this.queryById(userCourses.getUserId());
    }

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer userId) {
        return this.userCoursesMapper.deleteById(userId) > 0;
    }
}