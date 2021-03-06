package com.zlk.zlkproject.course.userSection.service;

import com.zlk.zlkproject.entity.UserSection;

import java.util.List;

/**
 * (UserSection)表服务接口
 *
 * @author makejava
 * @since 2019-11-26 17:02:05
 */
public interface UserSectionService {

    /**
     * 根据课程id查询评分数的和
     * @param coursesId
     * @return
     */
    Integer querySumByCoursesId(Integer coursesId);

    /**
     * 根据小节id查询评分数的和
     * @param sectionId
     * @return
     */
    Integer querySumBySectionId(Integer sectionId);

    /**
     * 根据小节id查询有多少个有相同小节id的数据
     * @param sectionId
     * @return
     */
    Integer queryCountBySectionId(Integer sectionId);

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    UserSection queryById(String userId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<UserSection> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param userSection 实例对象
     * @return 实例对象
     */
    UserSection insert(UserSection userSection);

    /**
     * 修改数据
     *
     * @param userSection 实例对象
     * @return 实例对象
     */
    UserSection update(UserSection userSection);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    boolean deleteById(String userId);

}