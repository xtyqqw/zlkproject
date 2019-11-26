package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: Cooperative
 * @description: 合作企业实体类
 * @author: xty
 * @create: 2019/11/25 17:11
 **/
@Getter
@Setter
@ToString
public class Cooperative {
    //主键ID
    private Integer id;
    //企业名称
    private String name;
    //企业信息
    private String msg;
}
