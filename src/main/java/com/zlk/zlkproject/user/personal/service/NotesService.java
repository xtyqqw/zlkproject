package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.user.entity.Notes;

import java.util.List;

public interface NotesService {
    /*查询个人笔记*/
    List<Notes> selectNotes();
    /*修改个人笔记*/
    Integer updateNotes(Notes notes);
    /*删除个人笔记*/
    Integer deleteNotes(Integer snId);
}
