package com.zlk.zlkproject.course.stuNote.service;

import com.zlk.zlkproject.entity.StuNote;
import com.zlk.zlkproject.entity.StuNoteRes;

import java.util.List;

public interface StuNoteService {
    /**
     *  新增学生笔记
     *@method addStuNote
     *@params [StuNote]
     *@return Integer
     *@author hry
     *@time 2019/11/27  11:23
     */
    public Integer addStuNote(StuNote stuNote);

    /**
     *  分页查询学生笔记按使事件最新
     *@method findStuNote
     *@params [Integer]
     *@return StuNoteRes
     *@author hry
     *@time 2019/11/28  11:31
     */
    public List<StuNoteRes> findStuNote(String userId, Integer sectionId, Integer page, Integer size);

    /**
     *  分页查询学生笔记按点赞最多
     *@method findStuNoteUp
     *@params [Integer]
     *@return StuNoteRes
     *@author hry
     *@time 2019/11/29  15:32
     */
    public List<StuNoteRes> findStuNoteUp(String userId, Integer sectionId, Integer page, Integer size);

    /**
     *  查询全部学生笔记条数
     *@method findCount
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/11/28  11:43
     */
    public Integer findCount(Integer sectionId,String userId);

    /**
     *  添加点赞记录
     *@method upAdd
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  10:05
     */
    public Integer upAdd(Integer snId,String userId,String upOrDown);

    /**
     *  添加点踩记录
     *@method downAdd
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  13:45
     */
    public Integer downAdd(Integer snId,String userId,String upOrDown);

    /**
     *  删除点赞记录
     *@method upDelete
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  10:57
     */
    public Integer upDelete(Integer snId,String userId);

    /**
     *  删除点踩记录
     *@method downDelete
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  14:09
     */
    public Integer downDelete(Integer snId,String userId);

    /**
     *  点赞增加点踩减少
     *@method upAddDownDelete
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  11:31
     */
    public Integer upAddDownDelete(Integer snId,String userId,String upOrDown);

    /**
     *  点踩增加点赞减少
     *@method downAddUpDelete
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  14:19
     */
    public Integer downAddUpDelete(Integer snId,String userId,String upOrDown);

    /**
     *  修改report字段
     *@method updateReport
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  15:44
     */
    public Integer updateReport(Integer snId,String state);

    /**
     *  修改collect字段
     *@method updateCollect
     *@params [Integer，String]
     *@return Integer
     *@author hry
     *@time 2019/12/02  17:15
     */
    public Integer updateCollect(Integer snId,String state,String userId);
}
