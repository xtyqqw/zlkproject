package com.zlk.zlkproject.community.question.dao;

import com.zlk.zlkproject.user.entity.Action;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @program: ActionAddRepository
 * @description:
 * @author: gby
 * @date: 2019/12/6 10:47
 */
public interface ActionDao extends JpaRepository<Action,String>, JpaSpecificationExecutor<Action> {
}
