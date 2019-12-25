package com.zlk.zlkproject.community.question.service.impl;

import com.zlk.zlkproject.community.articleAdd.dao.ActionAddRepository;
import com.zlk.zlkproject.community.question.dao.ActionDao;
import com.zlk.zlkproject.community.question.service.ActionService;
import com.zlk.zlkproject.user.entity.Action;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

/**
 * @author gby
 * @ClassName ActionServiceImpl
 * @description 动态
 * @date 2019/12/23 16:56
 */
public class ActionServiceImpl implements ActionService {
    @Autowired
    private ActionAddRepository actionAddRepository;

    @Override
    public Action saveAction(Action action) {
        //发布文章的动态的值为1
        action.setActionType("4");
        //发布文章的动态的时间
        action.setCreateTime(new Date());
        return actionAddRepository.save(action);
    }
}
