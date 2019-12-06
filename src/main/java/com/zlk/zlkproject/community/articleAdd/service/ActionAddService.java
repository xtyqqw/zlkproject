package com.zlk.zlkproject.community.articleAdd.service;

import com.zlk.zlkproject.user.entity.Action;

/**
 * @program: ActionAddService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/6 10:48
 */
public interface ActionAddService {

    /**
     * @description: 文章发布后审核成功时自动增加一个发文动态
     * @param action
     * @return: com.zlk.zlkproject.user.entity.Action
     * @author: QianKeQin
     * @date: 2019/12/6 11:00
     */
    Action saveAction(Action action);
}
