package com.zlk.zlkproject.course.kechengxiangqingtest.service;

import com.zlk.zlkproject.course.kechengxiangqingtest.entity.Kechengxiaojei;
import java.util.List;

/**
 * (Kechengxiaojei)表服务接口
 *
 * @author makejava
 * @since 2019-11-23 10:18:41
 */
public interface KechengxiaojeiService {


    /**
     * 查询数据总数
     * @return 数据总数
     */
    Integer queryCount();

    /**
     * 通过ID查询单条数据
     *
     * @param xiaojeiId 主键
     * @return 实例对象
     */
    Kechengxiaojei queryById(Integer xiaojeiId);

    /**
     * 查询多条数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<Kechengxiaojei> queryAllByLimit(int offset, int limit);

    /**
     * 新增数据
     *
     * @param kechengxiaojei 实例对象
     * @return 实例对象
     */
    Kechengxiaojei insert(Kechengxiaojei kechengxiaojei);

    /**
     * 修改数据
     *
     * @param kechengxiaojei 实例对象
     * @return 实例对象
     */
    Kechengxiaojei update(Kechengxiaojei kechengxiaojei);

    /**
     * 通过主键删除数据
     *
     * @param xiaojeiId 主键
     * @return 是否成功
     */
    boolean deleteById(Integer xiaojeiId);

}