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
}
