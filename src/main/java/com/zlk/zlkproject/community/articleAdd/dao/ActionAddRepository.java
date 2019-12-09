package com.zlk.zlkproject.community.articleAdd.dao;

import com.zlk.zlkproject.user.entity.Action;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

/**
 * @program: ActionAddRepository
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/6 10:47
 */
public interface ActionAddRepository extends JpaRepository<Action,String>, JpaSpecificationExecutor<Action> {
}
