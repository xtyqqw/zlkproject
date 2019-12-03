package com.zlk.zlkproject.community.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: Article
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 10:09
 */

@Getter
@Setter
@Entity
@Table(name = "c_article")
public class Article {

    /**文章id uuid*/
    @Id
    @GeneratedValue
    private Long id;
    /**文章标题*/
    private String title;
    /**浏览数*/
    private Integer browseCount;
    /**评论数*/
    private Integer commentCount;
    /**发布时间*/
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;
    /**更新时间*/
    @Temporal(TemporalType.TIMESTAMP)
    private Date updateTime;
    /**插图相对路径*/
    private String figures;
    /**插图绝对路径*/
    private String figuresReal;
    /**文章摘要*/
    private String articleDigest;
    /**文章内容*/
    private String articleContent;
    /**赞数*/
    private Integer zanCount;
    /**踩数*/
    private Integer caiCount;
    /**举报：0 是，1 否*/
    private Integer inform;
    /**发文类型：0 原创，1 转载，2 翻译*/
    private Integer createArticleType;
    /**文章置顶：0 置顶，1 不置顶*/
    private Integer articleSetTop;
    /**审核：0 审核中，1 审核过，2 审核未过*/
    private Integer approval;

    @ManyToOne
    private Type type;

    @ManyToMany(cascade = {CascadeType.PERSIST})
    private List<Tag> tags=new ArrayList<>();

    @ManyToOne
    private User user;

    @OneToMany(mappedBy = "article")
    private List<Comment> comments=new ArrayList<>();

    public Article() {
    }

    @Override
    public String toString() {
        return "Article{" +
                "id='" + id + '\'' +
                ", title='" + title + '\'' +
                ", browseCount=" + browseCount +
                ", commentCount=" + commentCount +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", figures='" + figures + '\'' +
                ", figuresReal='" + figuresReal + '\'' +
                ", articleDigest='" + articleDigest + '\'' +
                ", articleContent='" + articleContent + '\'' +
                ", zanCount=" + zanCount +
                ", caiCount=" + caiCount +
                ", inform=" + inform +
                ", createArticleType=" + createArticleType +
                ", articleSetTop=" + articleSetTop +
                ", approval=" + approval +
                ", type=" + type +
                '}';
    }
}
