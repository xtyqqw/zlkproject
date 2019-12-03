package com.zlk.zlkproject.course.stu_comment.service;

import com.zlk.zlkproject.entity.StuComment;

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
}
