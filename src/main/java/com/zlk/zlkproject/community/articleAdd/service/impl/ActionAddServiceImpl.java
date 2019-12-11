package com.zlk.zlkproject.community.articleAdd.service.impl;

import com.zlk.zlkproject.community.articleAdd.dao.ActionAddRepository;
import com.zlk.zlkproject.community.articleAdd.service.ActionAddService;
import com.zlk.zlkproject.community.util.UUIDUtils;
import com.zlk.zlkproject.entity.Article;
import com.zlk.zlkproject.entity.User;
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
        //Article article=new Article();
        //User user=new User();
        action.setActionId(UUIDUtils.getId());
        //发布文章的动态的状态为1
        action.setActionType("1");
        //action.setArticleId(article.getArticleId());
        //发布文章的动态的时间
        action.setCreateTime(new Date());
        //action.setUserId(user.getUserId());
        //增加一条发文的动态
        return actionAddRepository.save(action);
    }
}
