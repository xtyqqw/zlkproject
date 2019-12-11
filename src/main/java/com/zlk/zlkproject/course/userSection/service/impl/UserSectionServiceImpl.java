package com.zlk.zlkproject.course.userSection.service.impl;

import com.zlk.zlkproject.course.userSection.mapper.UserSectionMapper;
import com.zlk.zlkproject.course.userSection.service.UserSectionService;
import com.zlk.zlkproject.entity.UserSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (UserSection)表服务实现类
 *
 * @author makejava
 * @since 2019-11-26 17:02:05
 */
@Service("userSectionService")
public class UserSectionServiceImpl implements UserSectionService {
    @Autowired
    private UserSectionMapper userSectionMapper;

    @Override
    public Integer querySumByCoursesId(Integer coursesId) {
        return userSectionMapper.querySumByCoursesId(coursesId);
    }

    @Override
    public Integer querySumBySectionId(Integer sectionId) {
        return userSectionMapper.querySumBySectionId(sectionId);
    }

    @Override
    public Integer queryCountBySectionId(Integer sectionId) {
        return userSectionMapper.queryCountBySectionId(sectionId);
    }

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    @Override
    public UserSection queryById(String userId) {
        return this.userSectionMapper.queryById(userId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<UserSection> queryAllByLimit(int offset, int limit) {
        return this.userSectionMapper.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param userSection 实例对象
     * @return 实例对象
     */
    @Override
    public UserSection insert(UserSection userSection) {
        this.userSectionMapper.insert(userSection);
        return userSection;
    }

    /**
     * 修改数据
     *
     * @param userSection 实例对象
     * @return 实例对象
     */
    @Override
    public UserSection update(UserSection userSection) {
        this.userSectionMapper.update(userSection);
        return this.queryById(userSection.getUserId());
    }

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String userId) {
        return this.userSectionMapper.deleteById(userId) > 0;
    }
}