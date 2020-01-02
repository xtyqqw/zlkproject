package com.zlk.zlkproject.community.question.dao;

import com.zlk.zlkproject.entity.Tag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @program: TagRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/3 14:09
 */
public interface QuestionAddTagDao extends JpaRepository<Tag, Integer>, JpaSpecificationExecutor<Tag> {
}
