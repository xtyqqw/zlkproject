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
    /**发文类型：原创，转载，翻译*/
    private String createArticleType;
    /**文章置顶：0 置顶，1 不置顶*/
    private Integer articleSetTop;
    /**文章方向*/
    private String typeName;
    /**发文时调用类别名称*/
    private List<Tag> tagList;
    /**查询时调用类别名称*/
    private User userList;
    /**审核：0 审核中，1 审核过，2 审核未过*/
    private Integer approval;

    public Article() {
    }

}
