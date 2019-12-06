package com.zlk.zlkproject.course.userChapter.service.impl;

import com.zlk.zlkproject.course.userChapter.mapper.UserChapterMapper;
import com.zlk.zlkproject.course.userChapter.service.UserChapterService;
import com.zlk.zlkproject.entity.UserChapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (UserChapter)表服务实现类
 *
 * @author makejava
 * @since 2019-11-26 16:14:40
 */
@Service("userChapterService")
public class UserChapterServiceImpl implements UserChapterService {
    @Autowired
    private UserChapterMapper userChapterMapper;

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    @Override
    public UserChapter queryById(String userId) {
        return this.userChapterMapper.queryById(userId);
    }

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<UserChapter> queryAllByLimit(int offset, int limit) {
        return this.userChapterMapper.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param userChapter 实例对象
     * @return 实例对象
     */
    @Override
    public UserChapter insert(UserChapter userChapter) {
        this.userChapterMapper.insert(userChapter);
        return userChapter;
    }

    /**
     * 修改数据
     *
     * @param userChapter 实例对象
     * @return 实例对象
     */
    @Override
    public UserChapter update(UserChapter userChapter) {
        this.userChapterMapper.update(userChapter);
        return this.queryById(userChapter.getUserId());
    }

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(String userId) {
        return this.userChapterMapper.deleteById(userId) > 0;
    }
}