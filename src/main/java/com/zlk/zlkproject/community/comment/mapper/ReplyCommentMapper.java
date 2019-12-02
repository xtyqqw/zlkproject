package com.zlk.zlkproject.community.comment.mapper;

import com.zlk.zlkproject.community.comment.entity.ReplyComment;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @program: ReplyCommentMapper
 * @description:
 * @author: QianKeQin
 * @date: 2019/11/21 10:20
 */

@Mapper
public interface ReplyCommentMapper {

    List<ReplyComment> getReplyCommentsByCommentId(int id);

    int addReplyComment(ReplyComment replyComment);
}
