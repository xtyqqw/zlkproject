package com.zlk.zlkproject.community.articleTag.dao;

import com.zlk.zlkproject.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * @program: TagsRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/6 9:25
 */
public interface TagsRepository extends JpaRepository<Tag, Integer> {
}
