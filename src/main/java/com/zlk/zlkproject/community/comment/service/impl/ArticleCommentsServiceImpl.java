package com.zlk.zlkproject.community.comment.service.impl;

import com.zlk.zlkproject.community.comment.dao.ArticleCommentsRepository;
import com.zlk.zlkproject.community.comment.service.ArticleCommentsService;
import com.zlk.zlkproject.entity.ArticleComment;
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
public class ArticleCommentsServiceImpl implements ArticleCommentsService {

    @Autowired
    private ArticleCommentsRepository articleCommentsRepository;

    @Override
    public List<ArticleComment> listCommentByArticleId(String articleId) {
        Sort.Order order=Sort.Order.desc("createTime");
        Sort sort=Sort.by(order);
        List<ArticleComment> articleComments=articleCommentsRepository.findByArticleArticleIdAndParentCommentNull(articleId,sort);
        return eachComment(articleComments);
    }

    @Transactional
    @Override
    public ArticleComment saveComment(ArticleComment articleComment) {
        String parentCommentId=articleComment.getParentComment().getId();
        if (!parentCommentId.equals("-1")) {
            Optional<ArticleComment> comment1=articleCommentsRepository.findById(parentCommentId);
            articleComment.setParentComment(comment1.orElse(null));
        } else {
            articleComment.setParentComment(null);
        }
        articleComment.setId(UUIDUtils.getId());
        articleComment.setCreateTime(new Date());
        return articleCommentsRepository.save(articleComment);
    }

    /**
     * 循环每个顶级的评论节点
     * @param articleComments
     * @return
     */
    private List<ArticleComment> eachComment(List<ArticleComment> articleComments) {
        List<ArticleComment> commentsView = new ArrayList<>();
        for (ArticleComment comment : articleComments) {
            ArticleComment c = new ArticleComment();
            BeanUtils.copyProperties(comment,c);
            commentsView.add(c);
        }
        //合并评论的各层子代到第一级子代集合中
        combineChildren(commentsView);
        return commentsView;
    }

    /**
     * @param articleComments root根节点，article不为空的对象集合
     * @return
     */
    private void combineChildren(List<ArticleComment> articleComments) {

        for (ArticleComment comment : articleComments) {
            List<ArticleComment> replys1 = comment.getReplyComments();
            for(ArticleComment reply1 : replys1) {
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
    private List<ArticleComment> tempReplys = new ArrayList<>();

    /**
     * 递归迭代，剥洋葱
     * @param articleComment 被迭代的对象
     * @return
     */
    private void recursively(ArticleComment articleComment) {
        tempReplys.add(articleComment);//顶节点添加到临时存放集合
        if (articleComment.getReplyComments().size()>0) {
            List<ArticleComment> replys = articleComment.getReplyComments();
            for (ArticleComment reply : replys) {
                tempReplys.add(reply);
                if (reply.getReplyComments().size()>0) {
                    recursively(reply);
                }
            }
        }
    }
}
