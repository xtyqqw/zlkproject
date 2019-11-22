package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zlk.zlkproject.community.util.UUIDUtils;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * @program: Article
 * @description: 文章实体类
 * @author: QianKeQin
 * @date: 2019/11/19 9:08
 */

@Getter
@Setter
public class Article {

    /**文章id uuid*/
    private String articleId = UUIDUtils.getId();
    /**文章标题*/
    private String title;
    /**方向种类*/
    private String typeName;
    /**标签名称*/
    private String tagName;
    /**浏览数*/
    private Integer browseCount;
    /**评论数*/
    private Integer commentCount;
    /**发布时间*/
    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**更新时间*/
    @JsonFormat(timezone = "GMT+8",pattern = "yyyy-MM-dd HH:mm:ss")
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
    /**举报*/
    private String inform;
    /**建立的是文章和用户的多对一关系*/
    private User user;
    /**建立的是文章和方向的多对一关系*/
    private Type type;
    /**建立的是文章和标签的多对一关系*/
    private Tag tag;

    public Article(String articleId, String title, String typeName, String tagName, Integer browseCount, Integer commentCount, Date createTime, Date updateTime, String figures, String figuresReal, String articleDigest, String articleContent, Integer zanCount, Integer caiCount, String inform, User user, Type type, Tag tag) {
        this.articleId = articleId;
        this.title = title;
        this.typeName = typeName;
        this.tagName = tagName;
        this.browseCount = browseCount;
        this.commentCount = commentCount;
        this.createTime = createTime;
        this.updateTime = updateTime;
        this.figures = figures;
        this.figuresReal = figuresReal;
        this.articleDigest = articleDigest;
        this.articleContent = articleContent;
        this.zanCount = zanCount;
        this.caiCount = caiCount;
        this.inform = inform;
        this.user = user;
        this.type = type;
        this.tag = tag;
    }

    public Article() {
    }
}
