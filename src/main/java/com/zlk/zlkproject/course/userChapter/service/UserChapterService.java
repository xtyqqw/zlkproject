package com.zlk.zlkproject.course.userChapter.service;

import com.zlk.zlkproject.entity.UserChapter;

import java.util.List;

/**
 * (UserChapter)表服务接口
 *
 * @author makejava
 * @since 2019-11-26 16:14:39
 */
public interface UserChapterService {

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    UserChapter queryById(String userId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<UserChapter> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param userChapter 实例对象
     * @return 实例对象
     */
    UserChapter insert(UserChapter userChapter);

    /**
     * 修改数据
     *
     * @param userChapter 实例对象
     * @return 实例对象
     */
    UserChapter update(UserChapter userChapter);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    boolean deleteById(String userId);

}