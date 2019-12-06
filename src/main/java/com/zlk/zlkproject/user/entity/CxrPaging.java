package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 崔新睿
 * @data 2019/11/26 - 13:38
 * 分页查询辅助实体类
 */
@Getter
@Setter
public class CxrPaging {
    //总页数
    private Integer totalCount;
    //当前页码
    private Integer page;
    //页面大小
    private Integer limit;
    //总页数
    private Integer totalPage;
    //起始页码
    private Integer startPage;

    //模糊查询条件
    private String condition;
    //无参构造
    public CxrPaging(){

    }
    public CxrPaging(Integer totalCount,
                     Integer page,
                     Integer totalPage,
                     Integer startPage,
                     String condition,
                     Integer limit){
        this.page=page;
        this.limit=limit;
        this.startPage=startPage;
        this.totalCount=totalCount;
        this.condition=condition;
        this.totalPage=totalPage;
    }

}
