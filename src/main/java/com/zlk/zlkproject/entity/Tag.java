package com.zlk.zlkproject.entity;

import lombok.*;

/**
 * @program: Tag
 * @description: 各个大项目中的小分类
 * @author: xty
 * @create: 2019/11/18 15:37
 **/
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Tag {
    /**tag对应id*/
    private Integer tagId;
    /**tag名称*/
    private String tagName;
    /**tag对应方向id*/
    private Integer tagTypeId;
    /**tag对应方向名*/
    private String tagTypeName;
}
