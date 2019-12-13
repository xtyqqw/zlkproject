package com.zlk.zlkproject.user.index.service;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.StuNote;

import java.util.List;

/**
 * MyNoteService接口
 * @author yzh
 */
public interface MyNoteService {
    /**
     * 根据ID查询个人笔记
     * @param snUserId
     * @return List<StuNote>
     */
    List<StuNote> findNotesBySnId(String snUserId);
    /**
     * 根据ID查询个人笔记个数
     * @param snUserId
     * @return Integer
     */
    Integer findNoteNumBySnId(String snUserId);
    /**
     * 根据ID修改个人笔记
     * @param stuNote
     * @return Integer
     */
    Integer editNoteBySnId(StuNote stuNote);
    /**
     * 根据ID删除个人笔记
     * @param snId
     * @return Integer
     */
    Integer deleteNoteBySnId(Integer snId);
    /**
     *分页查询个人笔记
     * @param pagination
     * @return List<StuNote>
     */
    List<StuNote> findNotesList(Pagination pagination);
    /**
     * 根据snId查询个人笔记内容
     * @param snId
     * @return
     */
    String findNoteBySn(Integer snId);
}
