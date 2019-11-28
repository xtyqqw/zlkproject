package com.zlk.zlkproject.course.comment.service;

import com.zlk.zlkproject.entity.Comment;
import com.zlk.zlkproject.entity.Pagination;

import java.util.List;


public interface CommentService {
    /**
     *@Author luanke
     *@Description //查询所有
     *@Date 19:25 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Courses>
     **/
    List<Comment> findCommentListByUserId(Comment comment ,Integer page,Integer limit,Integer commentUserId);

}
