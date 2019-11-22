package com.zlk.zlkproject.user.aboutus.service.impl;

import com.zlk.zlkproject.user.aboutus.mapper.RecruitMapper;
import com.zlk.zlkproject.user.aboutus.service.RecruitService;
import com.zlk.zlkproject.user.entity.Recruit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecruitServiceImpl implements RecruitService {
    @Autowired
    private RecruitMapper recruitMapper;
    @Override
    public Integer addRecruit(Recruit recruit){
        return recruitMapper.addRecruit(recruit);
    }

}
