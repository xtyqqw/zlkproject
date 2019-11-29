package com.zlk.zlkproject.course.stuNote.service.impl;

import com.zlk.zlkproject.course.stuNote.mapper.StuNoteMapper;
import com.zlk.zlkproject.course.stuNote.service.StuNoteService;
import com.zlk.zlkproject.entity.StuNote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/27 13:57
 */
@Service
public class StuNoteServiceImpl implements StuNoteService {

    @Autowired
    private StuNoteMapper stuNoteMapper;

    @Override
    public List<StuNote> selectAllByLimit(int page, int limit) {
        int offset = (page-1)*limit;
        List<StuNote> stuNotes=stuNoteMapper.selectAllByLimit(offset,limit);
        return stuNoteMapper.selectAllByLimit(offset,limit);
    }

    @Override
    public Integer selectCount() {
        return stuNoteMapper.selectCount();
    }

    @Override
    public Integer deleteStuNoteBySnId(Integer snId) {
        return stuNoteMapper.deleteStuNoteBySnId(snId);
    }


}
