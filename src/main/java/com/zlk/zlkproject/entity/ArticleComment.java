package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: ArticleComment
 * @description: 文章评论实体类
 * @author: QianKeQin
 * @date: 2019/12/5 10:41
 */

@Getter
@Setter
@Entity
@Table(name = "article_comment")
public class ArticleComment {

    @Id
    private String id;
    private String nickname;
    private String content;
    private String avatar;
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    /**评论和文章多对一关系*/
    @ManyToOne
    private Article article;
    /**父级评论和回复一对多关系*/
    @OneToMany(mappedBy = "parentComment")
    private List<ArticleComment> replyComments=new ArrayList<>();
    /**回复和父级评论多对一关系*/
    @ManyToOne
    private ArticleComment parentComment;

    public ArticleComment() {
    }

}
