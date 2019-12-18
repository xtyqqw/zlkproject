package com.zlk.zlkproject.community.question.dao;

import com.zlk.zlkproject.entity.Question;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface QuestionDao extends JpaRepository<Question,String>, JpaSpecificationExecutor<Question> {


}
