package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @author 崔新睿
 * @data 2019/11/25 - 11:55
 * 意见反馈实体类
 */
@Getter
@Setter
public class Opinion {
    /*意见反馈id*/
    public String  opinionId;
    /*用户ID*/
    public String opinionUserId;
    /*意见反馈内容*/
    public String  opinionContext;
    /*提交意见反馈的时间*/
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public Date  opinionTime;
    //无参构造
    public Opinion(){

    }
    //有参构造
    public Opinion(String opinionId,String opinionUserId,
                   String opinionContext,Date opinionTime ){
        this.opinionContext=opinionContext;
        this.opinionId=opinionId;
        this.opinionTime=opinionTime;
        this.opinionUserId=opinionUserId;
    }
}
