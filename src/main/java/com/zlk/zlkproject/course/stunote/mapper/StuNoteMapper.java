package com.zlk.zlkproject.course.stunote.mapper;

import com.zlk.zlkproject.entity.StuNote;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StuNoteMapper {
    /**
     *  新增学生笔记
     *@method addStuNote
     *@params [StuNote]
     *@return Integer
     *@author hry
     *@time 2019/11/27  11:27
     */
    public Integer addStuNote(StuNote stuNote);
}
