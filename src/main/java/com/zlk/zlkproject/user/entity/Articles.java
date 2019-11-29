package com.zlk.zlkproject.user.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Tag;
import lombok.Getter;
import lombok.Setter;

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
    private String articleId = UUIDUtils.getId();
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
    /**举报*/
    private String inform;
    /**建立的是文章和用户的多对一关系*/
    private String userId;
    /**建立的是文章和标签的多对一关系*/
    private Integer tagId;

    private List<Tag> tagList=new ArrayList<>();
}

