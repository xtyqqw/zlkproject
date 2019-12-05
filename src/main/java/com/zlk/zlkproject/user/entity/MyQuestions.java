package com.zlk.zlkproject.user.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zlk.zlkproject.entity.Tag;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: MyQuestions
 * @description: 我的提问实体类
 * @author: xty
 * @create: 2019/12/3 10:36
 **/
@Getter
@Setter
public class MyQuestions {
    /**对应userId*/
    private String userId;
    /**type为0表示为问题*/
    private Integer type = 0;
    /**问题Id*/
    private Integer questionId;
    /**问题标题*/
    private String questionTitle;
    /**提问时间*/
    private Date createTime;
    /**浏览数*/
    private Integer browseCount;
    /**回答数*/
    private Integer responseCount;
    /**问题方向*/
    private String typeName;
    /**格式化后的日期*/
    private String formatDate;
    /**问题标签*/
    private List<Tag> tagList = new ArrayList<>();


}
