package com.zlk.zlkproject.community.comment.service.impl;

import com.zlk.zlkproject.community.comment.dao.CommentsRepository;
import com.zlk.zlkproject.community.comment.service.CommentsService;
import com.zlk.zlkproject.community.entity.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * @program: CommentServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 14:49
 */
@Service
public class CommentsServiceImpl implements CommentsService {

    @Autowired
    private CommentsRepository commentsRepository;

    @Override
    public List<Comment> listCommentByArticleId(Long articleId) {
        Sort.Order order=Sort.Order.desc("createTime");
        Sort sort=Sort.by(order);
        return commentsRepository.findByArticleIdAndParentCommentNull(articleId,sort);
    }

    @Transactional
    @Override
    public Comment saveComment(Comment comment) {
        Long parentCommentId=comment.getParentComment().getId();
        if (parentCommentId != -1) {
            comment.setParentComment(commentsRepository.findById(parentCommentId).get());
        } else {
            comment.setParentComment(null);
        }
        comment.setCreateTime(new Date());
        return commentsRepository.save(comment);
    }
}
