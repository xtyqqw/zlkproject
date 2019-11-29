package com.zlk.zlkproject.course.kechengxiangqingtest.mapper;

import com.zlk.zlkproject.course.kechengxiangqingtest.entity.Kechengxiaojei;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/25 9:02
 */
@Mapper
@Component
public interface xiangqingMapper {

    /**
     * 查询数据总数
     * @return 数据总数
     */
    Integer queryCountAAll();

    /**
     * 通过ID查询单条数据
     *
     * @param xiaojeiId 主键
     * @return 实例对象
     */
    Kechengxiaojei queryById(Integer xiaojeiId);

    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Kechengxiaojei> queryAllByLimit(int offset, int limit);


    /**
     * 通过实体作为筛选条件查询
     *
     * @param kechengxiaojei 实例对象
     * @return 对象列表
     */
    List<Kechengxiaojei> queryAll(Kechengxiaojei kechengxiaojei);

    /**
     * 新增数据
     *
     * @param kechengxiaojei 实例对象
     * @return 影响行数
     */
    int insert(Kechengxiaojei kechengxiaojei);

    /**
     * 修改数据
     *
     * @param kechengxiaojei 实例对象
     * @return 影响行数
     */
    int update(Kechengxiaojei kechengxiaojei);

    /**
     * 通过主键删除数据
     *
     * @param xiaojeiId 主键
     * @return 影响行数
     */
    int deleteById(Integer xiaojeiId);
}
