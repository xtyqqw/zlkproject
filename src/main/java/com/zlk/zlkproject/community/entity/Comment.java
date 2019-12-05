package com.zlk.zlkproject.community.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: Comment
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 10:18
 */

@Getter
@Setter
@Entity
@Table(name = "c_comment")
public class Comment {

    @Id
    //@GeneratedValue(strategy = GenerationType.IDENTITY)
    private String id;
    private String nickname;
    private String content;
    private String avatar;
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    @ManyToOne
    private Article article;

    @OneToMany(mappedBy = "parentComment")
    private List<Comment> replyComments=new ArrayList<>();

    @ManyToOne
    private Comment parentComment;

    public Comment() {
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", nickname='" + nickname + '\'' +
                ", content='" + content + '\'' +
                ", avatar='" + avatar + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
