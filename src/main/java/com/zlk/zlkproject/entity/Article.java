package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

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
    private String articleId;
    /**文章标题*/
    private String title;
    /**浏览数*/
    private Integer browseCount;
    /**评论数*/
    private Integer commentCount;
    /**发布时间*/
    //@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**更新时间*/
    //@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
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
    /**用户对象实例*/
    private User user;
    /**方向对象实例*/
    private Type type;
    /**标签对象实例*/
    private Tag tag;

    public Article(String articleId, String title, Integer browseCount, Integer commentCount, Date createTime, Date updateTime, String figures, String figuresReal, String articleDigest, String articleContent, Integer zanCount, Integer caiCount, String inform, User user, Type type, Tag tag) {
        this.articleId = articleId;
        this.title = title;
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
