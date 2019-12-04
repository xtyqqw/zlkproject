package com.zlk.zlkproject.community.articleAdd.dao;

import com.zlk.zlkproject.community.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @program: TagRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/3 14:09
 */
public interface ArticleAddTagRepository extends JpaRepository<Tag, Integer>, JpaSpecificationExecutor<Tag> {
}
