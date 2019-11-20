package com.zlk.zlkproject.user.personal.mapper;

import com.zlk.zlkproject.user.entity.Notes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NotesMapper {
    /*查询个人笔记*/
    List<Notes> selectNotes(Notes notes);
    /*修改笔记*/
    Integer updateNotes(Notes notes);
    /*删除笔记*/
    Integer deleteNotes(Integer snId);
}
