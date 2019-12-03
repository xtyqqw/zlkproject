package com.zlk.zlkproject.course.stuNote.mapper;

import com.zlk.zlkproject.entity.StuNote;
import com.zlk.zlkproject.entity.StuNoteRes;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StuNoteMapper {
    /**
     *  新增学生笔记
     *@method addStuNote
     *@params [StuNote]
     *@return Integer
     *@author hry
     *@time 2019/11/27  11:27
     */
    public Integer addStuNote(StuNote stuNote);

    /**
     *  分页查询学生笔记按事件最新
     *@method findStuNote
     *@params [Integer]
     *@return StuNoteRes
     *@author hry
     *@time 2019/11/28  11:14
     */
    public List<StuNoteRes> findStuNote(String userId, Integer sectionId, Integer page, Integer size);

    /**
     *  通过snId查询学生笔记
     *@method findStuNote
     *@params [Integer]
     *@return StuNoteRes
     *@author hry
     *@time 2019/12/02  11:11
     */
    public StuNoteRes findStuNoteBySnId(Integer snId);

    /**
     *  分页查询学生笔记按点赞最多
     *@method findStuNoteUp
     *@params [Integer]
     *@return StuNoteRes
     *@author hry
     *@time 2019/11/29  15:36
     */
    public List<StuNoteRes> findStuNoteUp(String userId, Integer sectionId, Integer page, Integer size);

    /**
     *  查询全部学生笔记条数
     *@method findCount
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/11/28  11:40
     */
    public Integer findCount(Integer sectionId,String userId);

    /**
     *  添加点赞点踩记录
     *@method upOrDownAdd
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  10:06
     */
    public Integer upOrDownAdd(Integer snId,String userId,String upOrDown);

    /**
     *  删除点赞记录
     *@method upDelete
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  10:58
     */
    public Integer upOrDownDelete(Integer snId,String userId);

    /**
     *  修改学生笔记up
     *@method updateStuNoteUp
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/02  10:18
     */
    public Integer updateStuNoteUp(Integer snId,Integer num);

    /**
     *  修改学生笔记down
     *@method updateStuNoteDown
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/02  11:34
     */
    public Integer updateStuNoteDown(Integer snId,Integer num);

    /**
     *  修改 踩/赞
     *@method upAdd
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  10:06
     */
    public Integer updateDownOrUp(Integer snId,String userId,String upOrDown);

    /**
     *  修改report字段
     *@method updateReport
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  15:45
     */
    public Integer updateReport(Integer snId,String state);

    /**
     *  修改collect字段
     *@method updateCollect
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/02  17:20
     */
    public Integer updateCollect(Integer snId,Integer num);

    /**
     *  新增collect
     *@method addCollect
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  17:20
     */
    public Integer addCollect(Integer snId,String userId);

    /**
     *  删除collect
     *@method deleteCollect
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  17:57
     */
    public Integer deleteCollect(Integer snId,String userId);
}
