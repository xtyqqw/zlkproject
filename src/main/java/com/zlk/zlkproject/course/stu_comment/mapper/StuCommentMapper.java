package com.zlk.zlkproject.course.stu_comment.mapper;

import com.zlk.zlkproject.entity.StuComment;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface StuCommentMapper {
    /**
     *  新增学生评论
     *@method addStuCmt
     *@params [StuComment]
     *@return Integer
     *@author hry
     *@time 2019/12/03  11:16
     */
    public Integer addStuCmt(StuComment stuComment);
}
