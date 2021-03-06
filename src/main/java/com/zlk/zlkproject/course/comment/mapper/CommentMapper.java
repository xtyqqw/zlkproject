package com.zlk.zlkproject.course.comment.mapper;

import com.zlk.zlkproject.entity.Comment;
import com.zlk.zlkproject.entity.Pagination;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CommentMapper {
    /**
     *@Author luanke
     *@Description //查询所有
     *@Date 19:16 2019/11/21
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Comment>
     **/
    List<Comment> findCommentListByUserId(Comment comment,Integer startPage,Integer limit,String commentUserId);

    /**
     *@Author luanke
     *@Description //查询总数
     *@Date 10:35 2019/12/10
     *@Param [comment, startPage, limit, commentUserId]
     *@return java.util.List<com.zlk.zlkproject.entity.Comment>
    **/
    Integer findCommentCountByUserId(String commentUserId);

}
