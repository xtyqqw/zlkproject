package com.zlk.zlkproject.course.stu_comment.service.impl;

import com.zlk.zlkproject.course.stu_comment.mapper.StuCommentMapper;
import com.zlk.zlkproject.course.stu_comment.service.StuCommentService;
import com.zlk.zlkproject.entity.StuComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @program: zlkproject
 * @description: 学生评论业务实现类
 * @author: hry
 * @create: 2019-12-03 11:12
 */
@Service
public class StuCommentServiceImpl implements StuCommentService {
    @Autowired
    private StuCommentMapper stuCommentMapper;

    @Override
    public Integer addStuCmt(StuComment stuComment) {
        return stuCommentMapper.addStuCmt(stuComment);
    }
}
