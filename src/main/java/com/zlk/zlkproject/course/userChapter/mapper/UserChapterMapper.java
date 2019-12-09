package com.zlk.zlkproject.course.userChapter.mapper;

import com.zlk.zlkproject.entity.UserChapter;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * (UserChapter)表数据库访问层
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/26 16:16
 */
@Mapper
@Component
public interface UserChapterMapper {

    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    UserChapter queryById(String userId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<UserChapter> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param userChapter 实例对象
     * @return 对象列表
     */
    List<UserChapter> queryAll(UserChapter userChapter);

    /**
     * 新增数据
     *
     * @param userChapter 实例对象
     * @return 影响行数
     */
    int insert(UserChapter userChapter);

    /**
     * 修改数据
     *
     * @param userChapter 实例对象
     * @return 影响行数
     */
    int update(UserChapter userChapter);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 影响行数
     */
    int deleteById(String userId);

}
