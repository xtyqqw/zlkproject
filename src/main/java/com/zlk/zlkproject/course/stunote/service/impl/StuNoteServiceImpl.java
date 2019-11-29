package com.zlk.zlkproject.course.stunote.service.impl;

import com.zlk.zlkproject.course.stunote.mapper.StuNoteMapper;
import com.zlk.zlkproject.course.stunote.service.StuNoteService;
import com.zlk.zlkproject.entity.StuNote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: zlkproject
 * @description: 学生笔记业务实现类
 * @author: hry
 * @create: 2019-11-27 11:24
 */
@Service
public class StuNoteServiceImpl implements StuNoteService {
    @Autowired
    private StuNoteMapper stuNoteMapper;

    @Override
    public Integer addStuNote(StuNote stuNote) {
        Integer res = stuNoteMapper.addStuNote(stuNote);
        return res;
    }
}
