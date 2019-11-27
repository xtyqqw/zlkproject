package com.zlk.zlkproject.course.teacherNote.service.impl;

import com.zlk.zlkproject.course.teacherNote.mapper.TeacherNoteMapper;
import com.zlk.zlkproject.course.teacherNote.service.TeacherNoteService;
import com.zlk.zlkproject.entity.TeacherNote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: zlkproject
 * @description: 教师笔记业务实现类
 * @author: zyx
 * @create: 2019-11-21 19:26
 */
@Service
public class TeacherNoteServiceImpl implements TeacherNoteService {
    @Autowired
    private TeacherNoteMapper teacherNoteMapper;

    @Override
    public List<TeacherNote> findNotesBySectionId(Integer sectionId, Integer page, Integer limit) {
        Integer offset = (page-1)*limit;
        return teacherNoteMapper.findNotesBySectionId(sectionId,offset,limit);
    }

    @Override
    public Integer findCountBySectionId(Integer sectionId) {
        return teacherNoteMapper.findCountBySectionId(sectionId);
    }
}
