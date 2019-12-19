package com.zlk.zlkproject.course.stuNoteAdmin.mapper;

import com.zlk.zlkproject.entity.StuNote;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/29 14:22
 */
@Mapper
@Component
public interface StuNoteAdminMapper {

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
     * 根据笔记对象修改笔记
     * @param stuNote
     * @return 影响行数
     */
    Integer updateStuNoteByStuNote(StuNote stuNote);

    /**
     * 通过主键删除数据
     *
     * @param snId 主键
     * @return 影响行数
     */
    Integer deleteStuNoteBySnId(Integer snId);

    /**
     * 根据小节Id查询并分页
     *
     * @param snSectionId 小节ID
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return 对象列表
     */
    List<StuNote> selectSNBySectionIdLimit(@Param("snSectionId") int snSectionId,@Param("offset") int offset, @Param("limit") int limit);

    /**
     * 根据小节Id查询总条数
     *
     * @param snSectionId 小节ID
     * @return 所有条数
     */
    Integer selectCountBySectionId(int snSectionId);
}
