package com.zlk.zlkproject.community.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * @program: Tag
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 10:15
 */

@Getter
@Setter
@Entity
@Table(name = "c_tag")
public class Tag {

    @Id
    @GeneratedValue
    private Long id;
    private String name;

    @ManyToMany(mappedBy = "tags")
    private List<Article> articles=new ArrayList<>();

    public Tag() {
    }
}
