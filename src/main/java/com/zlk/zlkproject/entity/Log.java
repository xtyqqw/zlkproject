package com.zlk.zlkproject.entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

/**
 * @ClassName Log
 * @Description: 日志实体类
 * @Author lufengxiang
 * Date 2019/11/18 17:41
 **/
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Log {
    //日志ID
    private Integer logId;
    //操作者用户名
    private String name;
    //操作内容
    private String description;
    //操作时间
    private Date time;
}
