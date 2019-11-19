package com.zlk.zlkproject.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @ClassName Admin
 * @Description: 管理员信息实体类
 * @Author lufengxiang
 * Date 2019/11/18 17:14
 **/
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Admin {
    //管理员ID
    private String adminId;
    //管理员用户名
    private String adminName;
    //管理员密码
    private String adminPassword;
    //管理员所属角色
    private String adminRole;
}
