package com.zlk.zlkproject.community.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @program: User
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/2 10:34
 */

@Entity
@Table(name = "c_user")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue
    private Long id;
    private String nickname;
    private String avatar;
    @Temporal(TemporalType.TIMESTAMP)
    private Date createTime;

    @OneToMany(mappedBy = "user")
    private List<Article> articles=new ArrayList<>();

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", nickname='" + nickname + '\'' +
                ", avatar='" + avatar + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
