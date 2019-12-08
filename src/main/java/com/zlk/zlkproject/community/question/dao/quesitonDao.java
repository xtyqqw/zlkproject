package com.zlk.zlkproject.community.question.dao;


import org.springframework.data.jpa.repository.JpaRepository ;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface quesitonDao extends JpaRepository<Question, String>, JpaSpecificationExecutor<Question> {


}