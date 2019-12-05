package com.zlk.zlkproject.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zlk.zlkproject.community.util.UUIDUtils;
import lombok.Getter;
import lombok.Setter;
import java.util.Date;
/**
 * @author gby
 * @ClassName question
 * @description 问答实体类
 * @date 2019/12/3 9:44
 */
@Getter
@Setter
public class Question {
    /*问题表id uuid*/
    private String questionId ;
    /*问题标题*/
    private String questionTitle;
    /*问题内容*/
    private String questionContent;
    /*是否解决：0没有解决，1已解决，2待解决*/
    private Integer solve;
    /*提问时间*/
    @JsonFormat(timezone = "ETC/GMT-8", pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;
    /**问题类型：0 原创，1 转载，2 翻译*/
    private String createQuestionType;
    /*浏览数*/
    private Integer browseCount;
    /*用户表主键*/
    private Integer userId;
    /*获赞数*/
    private Integer zanCount;
    /*被踩数*/
    private Integer caiCount;
    /*审核：0 审核中，1 审核过，2 审核未过*/
    private Integer check;
    /**标签名称*/
    private String tagName;
    /*分类*/
    private String typeName;
    /*小节表主键*/
    private Integer sectionId;
    /*回答数*/
    private Integer responseCount;

    public Question() {
    }

}
