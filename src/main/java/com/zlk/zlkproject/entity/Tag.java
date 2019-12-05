package com.zlk.zlkproject.entity;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: Tag
 * @description: 各个大项目中的小分类
 * @author: xty
 * @create: 2019/11/18 15:37
 **/
@Getter
@Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tag")
public class Tag {
    /**tag对应id*/
    @Id
    private Integer tagId;
    /**
     * tag名称
     */
    private String tagName;
    /**
     * tag对应方向id
     */
    private Integer tagTypeId;

    private String tagTypeName;
    /**标签和文章多对多关系*/
    @ManyToMany(mappedBy = "tags")
    private List<Article> articles=new ArrayList<>();
}
