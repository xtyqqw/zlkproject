package com.zlk.zlkproject.course.kechengxiangqingtest.entity;

import java.io.Serializable;

/**
 * (Kechengxiaojei)实体类
 *
 * @author makejava
 * @since 2019-11-23 10:18:40
 */
public class Kechengxiaojei implements Serializable {
    private static final long serialVersionUID = 741144554699409185L;
    
    private Integer xiaojeiId;
    
    private String xiaojeiName;
    
    private String xiaojeiJianjei;
    
    private String xiaojeiShijian;
    
    private String xiaojeiPinfen;
    
    private String xiaojeiZhuangtai;


    public Integer getXiaojeiId() {
        return xiaojeiId;
    }

    public void setXiaojeiId(Integer xiaojeiId) {
        this.xiaojeiId = xiaojeiId;
    }

    public String getXiaojeiName() {
        return xiaojeiName;
    }

    public void setXiaojeiName(String xiaojeiName) {
        this.xiaojeiName = xiaojeiName;
    }

    public String getXiaojeiJianjei() {
        return xiaojeiJianjei;
    }

    public void setXiaojeiJianjei(String xiaojeiJianjei) {
        this.xiaojeiJianjei = xiaojeiJianjei;
    }

    public String getXiaojeiShijian() {
        return xiaojeiShijian;
    }

    public void setXiaojeiShijian(String xiaojeiShijian) {
        this.xiaojeiShijian = xiaojeiShijian;
    }

    public String getXiaojeiPinfen() {
        return xiaojeiPinfen;
    }

    public void setXiaojeiPinfen(String xiaojeiPinfen) {
        this.xiaojeiPinfen = xiaojeiPinfen;
    }

    public String getXiaojeiZhuangtai() {
        return xiaojeiZhuangtai;
    }

    public void setXiaojeiZhuangtai(String xiaojeiZhuangtai) {
        this.xiaojeiZhuangtai = xiaojeiZhuangtai;
    }

}