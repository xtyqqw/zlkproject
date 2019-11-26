package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.user.entity.Notes;
import com.zlk.zlkproject.user.personal.mapper.NotesMapper;
import com.zlk.zlkproject.user.personal.service.NotesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NotesServiceImpl implements NotesService {
    /*加载外部资源*/
    @Autowired(required = false)
    private NotesMapper notesMapper;
    /*重写方法查询*/
    @Override
    public List<Notes> selectNotes(String userId){
        return notesMapper.selectNotes(userId);
    }
    /*修改*/
    @Override
    public Integer updateNotes(Notes notes){
        return notesMapper.updateNotes(notes);
    }
    /*删除*/
    @Override
    public Integer deleteNotes(Integer snId){
        return notesMapper.deleteNotes(snId);
    }
}
