package com.zlk.zlkproject.community.articleAdd.service.impl;

import com.zlk.zlkproject.community.articleAdd.dao.ActionAddRepository;
import com.zlk.zlkproject.community.articleAdd.service.ActionAddService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.user.entity.Action;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

/**
 * @program: ActionAddServiceImpl
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/6 10:52
 */

@Service
public class ActionAddServiceImpl implements ActionAddService {

    @Autowired
    private ActionAddRepository actionAddRepository;

    @Transactional
    @Override
    public Action saveAction(Action action) {
        //发布文章的动态的值为1
        action.setActionType("1");
        //发布文章的动态的时间
        action.setCreateTime(new Date());
        return actionAddRepository.save(action);
    }
}
