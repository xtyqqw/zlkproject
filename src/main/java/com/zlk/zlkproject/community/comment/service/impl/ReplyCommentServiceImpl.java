package com.zlk.zlkproject.community.comment.service.impl;

import com.zlk.zlkproject.community.comment.entity.ReplyComment;
import com.zlk.zlkproject.community.comment.mapper.ReplyCommentMapper;
import com.zlk.zlkproject.community.comment.service.ReplyCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: ReplyCommentServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/21 10:24
 */

@Service
public class ReplyCommentServiceImpl implements ReplyCommentService {

    @Autowired
    private ReplyCommentMapper replyCommentMapper;

    @Override
    public List<ReplyComment> getReplyCommentsByCommentId(int id) {
        return replyCommentMapper.getReplyCommentsByCommentId(id);
    }

    @Override
    public int addReplyComment(ReplyComment replyComment) {
        return replyCommentMapper.addReplyComment(replyComment);
    }
}
