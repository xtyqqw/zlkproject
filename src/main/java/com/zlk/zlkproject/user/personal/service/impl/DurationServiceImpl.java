package com.zlk.zlkproject.user.personal.service.impl;

import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.user.personal.mapper.DurationMapper;
import com.zlk.zlkproject.user.personal.service.DurationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.jws.soap.SOAPBinding;
import java.awt.*;
import java.util.List;

@Service
public class DurationServiceImpl implements DurationService {
    /*加载外部资源*/
    @Autowired(required = false)
    private DurationMapper durationMapper;
    /*重写方法*/
    @Override
    public User selectDuration(User user){
        return durationMapper.selectDuration(user);

    }
    @Override
    public Integer findUser(){
        return durationMapper.findUser();
    }
    @Override
    public Integer findUserById(String userId){
        return durationMapper.findUserById(userId);
    }

}
