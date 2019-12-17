package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.mapper.DurationMapper;
import com.zlk.zlkproject.user.personal.service.DurationService;
import com.zlk.zlkproject.user.until.Arith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.soap.SOAPBinding;
import java.awt.*;
import java.util.List;
/*查询个人学习看板*/
@Service
public class DurationServiceImpl implements DurationService {
    /*加载外部资源*/
    @Autowired(required = false)
    private DurationMapper durationMapper;

    /**
     * 查询每日和总学习时长
     * @param userId
     * @return
     */
    @Override
    public User selectDuration(String userId){
        User user=durationMapper.selectDuration(userId);
        user.setUserDateTime(Arith.toHour(user.getUserDateTime()));
        return user;

    }

    /**
     * 查询用户总数
     * @return
     */
    @Override
    public Integer findUser(){
        return durationMapper.findUser();
    }

    /**
     * 根据查询排名
     * @param userId
     * @return
     */
    @Override
    public Integer findUserById(String userId){
        return durationMapper.findUserById(userId);
    }

}
