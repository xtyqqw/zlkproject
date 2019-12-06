package com.zlk.zlkproject.user.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Tag;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @ClassName： Articles
 * @Description： 文章类
 * @Author： sd
 * @Date： 2019/11/25 19:47
 */
@Getter
@Setter
public class Articles {

    /**文章id uuid*/
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
    private String createDate;
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
    /**发文类型：原创，转载，翻译*/
    private Integer createArticleType;
    /**文章置顶：0 置顶，1 不置顶*/
    private Integer articleSetTop;
    /**文章方向*/
    private String typeName;

    private String tagName;
    /**建立的是文章和用户的多对一关系*/
    private String userId;
    /**发文时调用类别名称*/
    private List<Tag> tagList;
    /**审核：0 审核中，1 审核过，2 审核未过*/
    private Integer approval;

    public Articles() {
    }

    public Articles(String articleId, String title, Integer browseCount, Integer commentCount, Date createTime, String createDate, Date updateTime, String figures, String figuresReal, String articleDigest, String articleContent, Integer zanCount, Integer caiCount, Integer inform, Integer createArticleType, Integer articleSetTop, String typeName, String tagName, String userId, List<Tag> tagList, Integer approval) {
        this.articleId = articleId;
        this.title = title;
        this.browseCount = browseCount;
        this.commentCount = commentCount;
        this.createTime = createTime;
        this.createDate = createDate;
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
        this.approval = approval;
    }
}

