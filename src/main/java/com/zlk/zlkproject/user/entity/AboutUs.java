package com.zlk.zlkproject.user.entity;

import lombok.Getter;
import lombok.Setter;

/**
 * @author 崔新睿
 * @data 2019/11/22 - 9:16
 * 关于我们首页实体类
 */
@Getter
@Setter
public class AboutUs {
    /*关于我们主键*/
    private String aboutusId;
    /*智量酷是什么机构*/
    private String aboutusOrganization;
    /*智量酷建立初衷是什么*/
    private String aboutusCause;
    /*智量酷在做什么*/
    private String aboutusJob;
    /*智量酷在追求什么*/
    private String aboutusChase;
    /*智量酷是谁*/
    private String aboutusZlk;
    //无参构造
    public AboutUs(){

    }
    //有参构造
    public AboutUs(String aboutusId,String aboutusOrganization
                    ,String aboutusCause,String aboutusJob,String aboutusChase
                    ,String aboutusZlk){
        this.aboutusId=aboutusId;
        this.aboutusOrganization=aboutusOrganization;
        this.aboutusCause=aboutusCause;
        this.aboutusChase=aboutusChase;
        this.aboutusJob=aboutusJob;
        this.aboutusZlk=aboutusZlk;

    }



}
