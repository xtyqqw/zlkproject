package com.zlk.zlkproject.admin.util;

import lombok.Getter;
import lombok.Setter;

/**
 * @ClassName Pagination
 * @Description: 后台管理系统分页实体类
 * @Author lufengxiang
 * Date 2019/11/19 10:48
 **/
@Getter
@Setter
public class Pagination {
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
}
