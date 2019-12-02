package com.zlk.zlkproject.entity.vo;

import lombok.Getter;
import lombok.Setter;

/**
 * 查询小节详情的工具类
 * @author wangzheng
 * @version 1.0
 * @date 2019/11/25 14:23
 */
@Getter
@Setter
public class SectionDetails {

    /**小节id 主键 */
    private Integer sectionId;

    /**小节名字*/
    private String sectionName;

    /**小节简介 */
    private String sectionIntro;

    /**小节时长 */
    private Integer sectionTime;

    /**个人观看的状态 */
    private String state;
}
