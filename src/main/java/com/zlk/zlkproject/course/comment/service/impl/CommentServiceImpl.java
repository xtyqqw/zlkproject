package com.zlk.zlkproject.course.comment.service.impl;

import com.zlk.zlkproject.course.comment.mapper.CommentMapper;
import com.zlk.zlkproject.course.comment.service.CommentService;
import com.zlk.zlkproject.entity.Comment;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName commentServiceImpl
 * @Description: 业务层
 * @Author LuanKe
 * Date 2019/11/27 9:36
 **/
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;
    /**
     *@Author luanke
     *@Description //分页查询内容
     *@Date 10:46 2019/11/27
     *@Param [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Comment>
    **/
    @Override
    public List<Comment> findCommentListByUserId(Comment comment,Integer page,Integer limit,Integer commentUserId) {
        comment.getUserRealname();
        Integer startPage = (page-1)*limit;
        return commentMapper.findCommentListByUserId(comment,startPage,limit,commentUserId);
    }


}
