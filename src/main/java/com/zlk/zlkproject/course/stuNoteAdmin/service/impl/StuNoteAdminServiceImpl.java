package com.zlk.zlkproject.course.stuNoteAdmin.service.impl;

import com.zlk.zlkproject.course.stuNoteAdmin.mapper.StuNoteAdminMapper;
import com.zlk.zlkproject.course.stuNoteAdmin.service.StuNoteAdminService;
import com.zlk.zlkproject.entity.StuNote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/29 14:24
 */
@Service
public class StuNoteAdminServiceImpl implements StuNoteAdminService {
    @Autowired
    private StuNoteAdminMapper stuNoteAdminMapper;

    /**
     * 分页查询所有数据
     * @param page
     * @param limit 查询条数
     * @return
     */
    @Override
    public List<StuNote> selectAllByLimit(int page, int limit) {
        int offset = (page-1)*limit;
        List<StuNote> stuNotes=stuNoteAdminMapper.selectAllByLimit(offset,limit);
        return stuNoteAdminMapper.selectAllByLimit(offset,limit);
    }

    /**
     * 查询数据条数
     * @return
     */
    @Override
    public Integer selectCount() {
        return stuNoteAdminMapper.selectCount();
    }

    /**
     * 根据笔记对象修改笔记
     * @param stuNote
     * @return 影响行数
     */
    @Override
    public Integer updateStuNoteByStuNote(StuNote stuNote) {
        return stuNoteAdminMapper.updateStuNoteByStuNote(stuNote);
    }

    /**
     * 通过主键删除数据
     *
     * @param snId 主键
     * @return 影响行数
     */
    @Override
    public Integer deleteStuNoteBySnId(Integer snId) {
        return stuNoteAdminMapper.deleteStuNoteBySnId(snId);
    }


}
