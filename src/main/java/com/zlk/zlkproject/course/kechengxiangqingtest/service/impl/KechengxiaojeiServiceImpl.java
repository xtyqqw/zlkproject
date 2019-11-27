package com.zlk.zlkproject.course.kechengxiangqingtest.service.impl;

import com.zlk.zlkproject.course.kechengxiangqingtest.entity.Kechengxiaojei;
import com.zlk.zlkproject.course.kechengxiangqingtest.mapper.xiangqingMapper;
import com.zlk.zlkproject.course.kechengxiangqingtest.service.KechengxiaojeiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * (Kechengxiaojei)表服务实现类
 *
 * @author makejava
 * @since 2019-11-23 10:18:42
 */
@Service("kechengxiaojeiService")
public class KechengxiaojeiServiceImpl implements KechengxiaojeiService {
    @Autowired
    private xiangqingMapper kechengxiangqingMapper;

    @Override
    public Integer queryCount() {
        return kechengxiangqingMapper.queryCountAAll();
    }

    /**
     * 通过ID查询单条数据
     *
     * @param xiaojeiId 主键
     * @return 实例对象
     */
    @Override
    public Kechengxiaojei queryById(Integer xiaojeiId) {
        return this.kechengxiangqingMapper.queryById(xiaojeiId);
    }

    /**
     * 查询多条数据
     *
     * @param page 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    @Override
    public List<Kechengxiaojei> queryAllByLimit(int page, int limit) {
        int offset=(page-1)*limit;
        return kechengxiangqingMapper.queryAllByLimit(offset, limit);
    }

    /**
     * 新增数据
     *
     * @param kechengxiaojei 实例对象
     * @return 实例对象
     */
    @Override
    public Kechengxiaojei insert(Kechengxiaojei kechengxiaojei) {
        this.kechengxiangqingMapper.insert(kechengxiaojei);
        return kechengxiaojei;
    }

    /**
     * 修改数据
     *
     * @param kechengxiaojei 实例对象
     * @return 实例对象
     */
    @Override
    public Kechengxiaojei update(Kechengxiaojei kechengxiaojei) {
        this.kechengxiangqingMapper.update(kechengxiaojei);
        return this.queryById(kechengxiaojei.getXiaojeiId());
    }

    /**
     * 通过主键删除数据
     *
     * @param xiaojeiId 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Integer xiaojeiId) {
        return this.kechengxiangqingMapper.deleteById(xiaojeiId) > 0;
    }
}