package com.zlk.zlkproject.user.index.service.serviceimpl;

import com.zlk.zlkproject.entity.Pagination;
import com.zlk.zlkproject.user.entity.StuNote;
import com.zlk.zlkproject.user.index.mapper.MyNoteMapper;
import com.zlk.zlkproject.user.index.service.MyNoteService;
import com.zlk.zlkproject.user.until.LeaveTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName： MyNoteServiceImpl
 * @Description： MyNoteService实现类
 * @Author： yzh
 * @Date： 2019/11/28 10:55
 */
@Service
public class MyNoteServiceImpl implements MyNoteService {
    @Autowired(required = false)
    private MyNoteMapper myNoteMapper;
    /**
     * 根据ID查询个人笔记
     * @param snUserId
     * @return List<StuNote>
     */
    @Override
    public List<StuNote> findNotesBySnId(String snUserId) {
        List<StuNote> list=myNoteMapper.findNotesBySnId(snUserId);
        int s=list.size();
        for(int i=0;i<s;i++){
            StuNote stuNote=list.get(i);
            stuNote.setStuTime(LeaveTime.formatDate(stuNote.getSnDate()));
            list.set(i,stuNote);
        }
        return list;
        /*return myNoteMapper.findNotesBySnId(snUserId);*/
    }
    /**
     * 根据ID查询个人笔记个数
     * @param snUserId
     * @return Integer
     */
    @Override
    public Integer findNoteNumBySnId(String snUserId) {
        return myNoteMapper.findNoteNumBySnId(snUserId);
    }

    /**
     * 根据ID修改个人笔记
     * @param stuNote
     * @return Integer
     */
    @Override
    public Integer editNoteBySnId(StuNote stuNote) {
        return myNoteMapper.editNoteBySnId(stuNote);
    }
    /**
     * 根据ID删除个人笔记
     * @param snId
     * @return Integer
     */
    @Override
    public Integer deleteNoteBySnId(Integer snId) {
        return myNoteMapper.deleteNoteBySnId(snId);
    }
    /**
     *流加载查询个人笔记
     * @param pagination
     * @return List<StuNote>
     */
    @Override
    public List<StuNote> findNotesList(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        List<StuNote> list =  myNoteMapper.findNotesList(pagination);
        int s=list.size();
        for(int i=0;i<s;i++){
            StuNote stuNote=list.get(i);
            stuNote.setStuTime(LeaveTime.formatDate(stuNote.getSnDate()));
            list.set(i,stuNote);
        }
        return list;
    }
}
