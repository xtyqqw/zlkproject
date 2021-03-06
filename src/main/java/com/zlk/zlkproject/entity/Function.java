package com.zlk.zlkproject.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

/**
 * @ClassName Function
 * @Description: 左侧导航栏实体类
 * @Author lufengxiang
 * Date 2019/11/18 17:38
 **/
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Function {
    //导航栏ID
    private Integer id;
    //导航栏名称
    private String name;
    //父导航栏ID
    private Integer pid;
    //跳转url
    private String url;
    //跳转的iframe
    private String target="maintarget";
    //备注
    private String comment;
    //子级菜单数量
    private Integer childrenNumber;
}
