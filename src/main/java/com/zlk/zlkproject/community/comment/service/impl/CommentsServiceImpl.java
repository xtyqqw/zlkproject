package com.zlk.zlkproject.community.comment.service.impl;

import com.zlk.zlkproject.community.comment.dao.CommentsRepository;
import com.zlk.zlkproject.community.comment.service.CommentsService;
import com.zlk.zlkproject.community.entity.Comment;
import com.zlk.zlkproject.community.util.UUIDUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

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
    public List<Comment> listCommentByArticleId(String articleId) {
        Sort.Order order=Sort.Order.desc("createTime");
        Sort sort=Sort.by(order);
        List<Comment> comments=commentsRepository.findByArticleIdAndParentCommentNull(articleId,sort);
        return eachComment(comments);
    }

    @Transactional
    @Override
    public Comment saveComment(Comment comment) {
        String parentCommentId=comment.getParentComment().getId();
        if (!parentCommentId.equals("-1")) {
            Optional<Comment> comment1=commentsRepository.findById(parentCommentId);
            comment.setParentComment(comment1.orElse(null));
        } else {
            comment.setParentComment(null);
        }
        comment.setId(UUIDUtils.getId());
        comment.setCreateTime(new Date());
        return commentsRepository.save(comment);
    }

    /**
     * 循环每个顶级的评论节点
     * @param comments
     * @return
     */
    private List<Comment> eachComment(List<Comment> comments) {
        List<Comment> commentsView = new ArrayList<>();
        for (Comment comment : comments) {
            Comment c = new Comment();
            BeanUtils.copyProperties(comment,c);
            commentsView.add(c);
        }
        //合并评论的各层子代到第一级子代集合中
        combineChildren(commentsView);
        return commentsView;
    }

    /**
     * @param comments root根节点，article不为空的对象集合
     * @return
     */
    private void combineChildren(List<Comment> comments) {

        for (Comment comment : comments) {
            List<Comment> replys1 = comment.getReplyComments();
            for(Comment reply1 : replys1) {
                //循环迭代，找出子代，存放在tempReplys中
                recursively(reply1);
            }
            //修改顶级节点的reply集合为迭代处理后的集合
            comment.setReplyComments(tempReplys);
            //清除临时存放区
            tempReplys = new ArrayList<>();
        }
    }

    //存放迭代找出的所有子代的集合
    private List<Comment> tempReplys = new ArrayList<>();

    /**
     * 递归迭代，剥洋葱
     * @param comment 被迭代的对象
     * @return
     */
    private void recursively(Comment comment) {
        tempReplys.add(comment);//顶节点添加到临时存放集合
        if (comment.getReplyComments().size()>0) {
            List<Comment> replys = comment.getReplyComments();
            for (Comment reply : replys) {
                tempReplys.add(reply);
                if (reply.getReplyComments().size()>0) {
                    recursively(reply);
                }
            }
        }
    }
}
