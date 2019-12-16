package com.zlk.zlkproject.community.question.dao;

import com.zlk.zlkproject.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface QuestionHomeDao extends JpaRepository<Question,String>, JpaSpecificationExecutor<Question> {

    @Transactional
    @Modifying
    @Query("update Question a set a.browseCount = a.browseCount+1 where a.questionId = ?1")
    int editBrowseCount(String questionId);
}
