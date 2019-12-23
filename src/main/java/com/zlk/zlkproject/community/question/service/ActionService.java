package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.user.entity.Action;

/**
 * @program: ActionAddService
 * @description:
 * @author: QianKeQin
 * @date: 2019/12/6 10:48
 */
public interface ActionService {

    /*
     * @descrption 问题发布后审核成功时自动增加一个动态
     * @author gby
     * @param [action]
     * @return com.zlk.zlkproject.user.entity.Action
     * @date 2019/12/23 17:01
     */
    Action saveAction(Action action);
}
