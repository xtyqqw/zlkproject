package com.zlk.zlkproject.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

/**
 * @ClassName Dept
 * @Description: 部门实体类
 * @Author lufengxiang
 * Date 2019/11/18 17:43
 **/
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Dept {
    //部门ID
    private String deptId;
    //部门名称
    private String deptName;
    //部门代码
    private String deptCode;
}
