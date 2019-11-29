package com.zlk.zlkproject.course.stuNote.service;

import com.zlk.zlkproject.entity.StuNote;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/27 13:55
 */
public interface StuNoteService {
    /**
     * 查询指定行数据
     *
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<StuNote> selectAllByLimit(@Param("offset") int offset, @Param("limit") int limit);

    /**
     * 查询所有条数
     *
     * @return 所有条数
     */
    Integer selectCount();

    /**
     * 通过主键删除数据
     *
     * @param snId 主键
     * @return 影响行数
     */
    Integer deleteStuNoteBySnId(Integer snId);
}
