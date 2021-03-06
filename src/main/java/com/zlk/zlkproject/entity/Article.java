package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: Article
 * @description: 文章实体类
 * @author: QianKeQin
 * @date: 2019/11/19 9:08
 */

@Getter
@Setter
@Entity
@Table(name = "article")
public class Article {

    /**文章id uuid*/
    @Id
    private String articleId;
    /**文章标题*/
    private String title;
    /**浏览数*/
    private Integer browseCount;
    /**评论数*/
    private Integer commentCount;
    /**发布时间*/
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**更新时间*/
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date updateTime;
    /**插图相对路径*/
    private String figures;
    /**文章摘要*/
    private String articleDigest;
    /**文章内容,仅供内容修改用,修改时要处理查询用的字段同步更新*/
    private String articleContent;
    /**HTML格式文章内容,仅供列表查询用*/
    private String articleContentHtml;
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
    /**方向名称*/
    private String typeName;
    /**添加文章时此属性做标签多选用，且不会在数据库中创建该字段*/
    @Transient
    private String tagIds;

    /**文章和标签多对多关系*/
    @ManyToMany(cascade = {CascadeType.PERSIST})
    @JoinTable(name = "article_tag",joinColumns = {@JoinColumn(name = "article_id",referencedColumnName = "articleId")},
            inverseJoinColumns = {@JoinColumn(name = "tag_id",referencedColumnName = "tagId")})
    private List<Tag> tags=new ArrayList<>();

    /**文章和用户多对一关系*/
    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public Article() {
    }

}
