package com.zlk.zlkproject.course.stu_comment.service;

import com.zlk.zlkproject.entity.StuComment;

import java.util.List;

public interface StuCommentService {
    /**
     *  新增学生评论
     *@method addStuCmt
     *@params [StuComment]
     *@return Integer
     *@author hry
     *@time 2019/12/03  11:11
     */
    public Integer addStuCmt(StuComment stuComment);

    /**
     *  查询学生评论按时间
     *@method findStuCmt
     *@params [Integer]
     *@return List<StuComment>
     *@author hry
     *@time 2019/12/03  17:30
     */
    public List<StuComment> findStuCmt(Integer sectionId, Integer page, Integer size);

    /**
     *  查询学生评论总条数
     *@method findStuCmtCount
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/03  17:35
     */
    public Integer findCount(Integer sectionId);

    /**
     *  行该学生评论赞踩数
     *@method updateUD
     *@params [Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/06  13:39
     */
    public Integer updateUD(String userId,Integer smId,String type);

    /**
     *  修改 stu_comment report数据
     *@method updateReport
     *@params [Integer,String]
     *@return Integer
     *@author hry
     *@time 2019/12/06  16:20
     */
    public Integer updateReport(Integer smId,String report);
}
