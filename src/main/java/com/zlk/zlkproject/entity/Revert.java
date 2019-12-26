package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.Date;
import java.util.List;


/**
 * @author gby
 * @ClassName Reply
 * @description 社区回复表
 * @date 2019/12/24 16:47
 */
@ToString
@Getter
@Setter
public class Revert {

    /*回答用户id*/
    private Integer revertId;
    /*父id*/
    private Integer rid;
    /**回复对象*/
    private String revertPerson;
    /*回复内容*/
    private String revertContent;
    /*回复时间*/
    private Date date;
    /**回复时间的字符串*/
    private String dateString;
    /*赞*/
    private Integer zanCount;
    /*踩*/
    private Integer caiCount;
    /**举报**/
    private Integer report;
    /*问题id*/
    private String questionId;
    /*用户id*/
    private String userId;
    /*用户名*/
    private String userRealName;
    /**用户头像*/
    private String userImg;
    /**子评论集合*/
    private List<Revert> revertList;
    /**赞踩集合*/
    private List<QuestionRevert> questionZanCaiList;

    private String flag;
    public Revert() {
    }
}
