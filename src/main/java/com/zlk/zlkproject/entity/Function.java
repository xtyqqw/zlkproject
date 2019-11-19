package com.zlk.zlkproject.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

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
    private Integer functionId;
    //导航栏名称
    private String functionName;
    //父导航栏ID
    private Integer parentId;
}
