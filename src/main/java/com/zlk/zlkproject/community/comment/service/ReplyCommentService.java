package com.zlk.zlkproject.community.comment.service;

import com.zlk.zlkproject.community.comment.entity.ReplyComment;

import java.util.List;

/**
 * @program: ReplyCommentService
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/21 9:54
 */
public interface ReplyCommentService {

    List<ReplyComment> getReplyCommentsByCommentId(int id);

    int addReplyComment(ReplyComment replyComment);
}
