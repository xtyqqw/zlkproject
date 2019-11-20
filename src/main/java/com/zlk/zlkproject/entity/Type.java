package com.zlk.zlkproject.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * @program: Type
 * @description: 方向实体类
 * @author: xty
 * @create: 2019/11/18 16:29
 **/
@Getter
@Setter
@ToString
public class Type {
    /**方向id*/
    private Integer typeId;
    /**方向种类
     * 分为：java，linux，html，mysql四种*/
    private String typeName;

    public Type(Integer typeId, String typeName) {
        this.typeId = typeId;
        this.typeName = typeName;
    }

    public Type() {
    }
}
