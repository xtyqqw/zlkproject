package com.zlk.zlkproject.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @ClassName Role
 * @Description: 角色实体类
 * @Author lufengxiang
 * Date 2019/11/18 17:36
 **/
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Role {
    //角色ID
    private String roleId;
    //角色名称
    private String roleName;
    //角色代码
    private String roleCode;
}
