package com.zlk.zlkproject.course.stunote.service;

import com.zlk.zlkproject.entity.StuNote;

public interface StuNoteService {
    /**
     *  新增学生笔记
     *@method addStuNote
     *@params [StuNote]
     *@return Integer
     *@author hry
     *@time 2019/11/27  11:23
     */
    public Integer addStuNote(StuNote stuNote);
}
