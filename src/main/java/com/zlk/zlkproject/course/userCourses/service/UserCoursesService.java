package com.zlk.zlkproject.course.userCourses.service;

import com.zlk.zlkproject.entity.UserCourses;

import java.util.List;

/**
 * (UserCourses)表服务接口
 *
 * @author makejava
 * @since 2019-11-26 16:14:58
 */
public interface UserCoursesService {

    /**
     * 通过实体作为筛选条件查询
     *
     * @param userCourses 实例对象
     * @return 对象列表
     */
    List<UserCourses> queryAll(UserCourses userCourses);

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    UserCourses queryById(String userId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<UserCourses> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param userCourses 实例对象
     * @return 实例对象
     */
    UserCourses insert(UserCourses userCourses);

    /**
     * 修改数据
     *
     * @param userCourses 实例对象
     * @return 实例对象
     */
    UserCourses update(UserCourses userCourses);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    boolean deleteById(String userId);

}