package com.zlk.zlkproject.community.comment.dao;

import com.zlk.zlkproject.community.entity.Comment;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * @program: CommentRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 14:50
 */
public interface CommentsRepository extends JpaRepository<Comment,Long> {

    List<Comment> findByArticleIdAndParentCommentNull(Long articleId, Sort sort);
}
