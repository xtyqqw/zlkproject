package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.stereotype.Service;

/**
 * @program: Help
 * @description: 帮助中心
 * @author: xty
 * @create: 2019/11/26 10:40
 **/
@Getter
@Setter
@ToString
public class Help {
    //id
    private Integer id;
    //关于智量酷是什么机构的信息
    private String zlkMsg;
    //建立初衷
    private String zlkPurpose;
    //智量酷在做什么
    private String zlkDo;
    //智量酷的追求
    private String zlkSeek;
    //智量酷是谁
    private String zlkIswho;

    public Help(Integer id, String zlkMsg, String zlkPurpose, String zlkDo, String zlkSeek, String zlkIswho) {
        this.id = id;
        this.zlkMsg = zlkMsg;
        this.zlkPurpose = zlkPurpose;
        this.zlkDo = zlkDo;
        this.zlkSeek = zlkSeek;
        this.zlkIswho = zlkIswho;
    }

    public Help() {
    }
}
