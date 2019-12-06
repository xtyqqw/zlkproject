package com.zlk.zlkproject.course.userSection.mapper;

import com.zlk.zlkproject.entity.UserSection;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * (UserSection)表数据库访问层
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/26 17:03
 */
@Mapper
@Component
public interface UserSectionMapper {
    /**
     * 通过ID查询单条数据
     *
     * @param userId 主键
     * @return 实例对象
     */
    UserSection queryById(String userId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<UserSection> queryAllByLimit(@Param("offset") int offset, @Param("limit") int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param userSection 实例对象
     * @return 对象列表
     */
    List<UserSection> queryAll(UserSection userSection);

    /**
     * 新增数据
     *
     * @param userSection 实例对象
     * @return 影响行数
     */
    int insert(UserSection userSection);

    /**
     * 修改数据
     *
     * @param userSection 实例对象
     * @return 影响行数
     */
    int update(UserSection userSection);

    /**
     * 通过主键删除数据
     *
     * @param userId 主键
     * @return 影响行数
     */
    int deleteById(String userId);
}
