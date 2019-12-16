package com.zlk.zlkproject.community.question.dao;

import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.Response;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @author gby
 * @ClassName ResponseDao
 * @description 回答
 * @date 2019/12/11 16:29
 */
public interface ResponseDao extends JpaRepository<Response,String>, JpaSpecificationExecutor<Response> {

}
