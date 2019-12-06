package com.zlk.zlkproject.course.teacherNote.mapper;

import com.zlk.zlkproject.entity.TeacherNote;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface TeacherNoteMapper {

    /**
     *  根据sectionId分页查询教师笔记
     *@method findNotesBySectionId
     *@params [sectionId, offset, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.TeacherNote>
     *@author zhang
     *@time 2019/11/22  10:48
     */
    List<TeacherNote> findNotesBySectionId(Integer sectionId, Integer offset, Integer limit);

    /**
     *  根据id查找总条数
     *@method findCountBySectionId
     *@params [sectionId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/11/22  14:47
     */
    Integer findCountBySectionId(Integer sectionId);

    /**
     * 查询教师笔记并分页
     * @param offset
     * @param limit
     * @return
     */
    List<TeacherNote> selectTNByLimit(Integer offset, Integer limit);

    /**
     * 查询记录条数
     * @return
     */
    Integer selectTNByCount();

    /**
     * 根据讲师笔记ID删除记录
     * @return
     */
    Integer deleteByTNId(Integer tnId);

    /**
     * 添加数据
     * @param teacherNote
     * @return
     */
    Integer insertTNByTeacherNote(TeacherNote teacherNote);

    /**
     * 根据讲师笔记对象修改数据
     * @param teacherNote
     * @return
     */
    Integer updateTNByTeacherNote(TeacherNote teacherNote);
}
