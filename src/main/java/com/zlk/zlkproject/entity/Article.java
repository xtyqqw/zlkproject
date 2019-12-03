package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zlk.zlkproject.community.util.UUIDUtils;
import lombok.Getter;
import lombok.Setter;

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
    /**举报：0 是，1 否*/
    private Integer inform;
    /**发文类型：0 原创，1 转载，2 翻译*/
    private Integer createArticleType;
    /**文章置顶：0 置顶，1 不置顶*/
    private Integer articleSetTop;
    /**文章方向*/
    private String typeName;
    /**标签*/
    private String tagName;
    /**建立的是文章和用户的多对一关系*/
    private String userId;
    /**发文时调用类别名称*/
    private List<Tag> tagList;
    /**查询时调用类别名称*/
    private User userList;
    /**审核：0 审核中，1 审核过，2 审核未过*/
    private Integer approval;

    public Article() {
    }

    public Article(String articleId, String title, Integer browseCount, Integer commentCount, Date createTime, Date updateTime, String figures, String figuresReal, String articleDigest, String articleContent, Integer zanCount, Integer caiCount, Integer inform, Integer createArticleType, Integer articleSetTop, String typeName, String tagName, String userId, List<Tag> tagList, User userList, Integer approval) {
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
        this.createArticleType = createArticleType;
        this.articleSetTop = articleSetTop;
        this.typeName = typeName;
        this.tagName = tagName;
        this.userId = userId;
        this.tagList = tagList;
        this.userList = userList;
        this.approval = approval;
    }
}
