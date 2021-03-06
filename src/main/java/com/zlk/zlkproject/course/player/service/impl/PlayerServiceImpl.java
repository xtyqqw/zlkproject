package com.zlk.zlkproject.course.player.service.impl;

import com.zlk.zlkproject.course.player.mapper.PlayerMapper;
import com.zlk.zlkproject.course.player.service.PlayerService;
import com.zlk.zlkproject.entity.UserSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @program: zlkproject
 * @description: 播放器业务实现类
 * @author: hry
 * @create: 2019-11-25 14:22
 */
@Service
public class PlayerServiceImpl implements PlayerService {
    @Autowired
    private PlayerMapper playerMapper;
    @Override
    public void recordTime(UserSection userSection) {
        Date date = new Date();
        playerMapper.recordTime(userSection, date);
    }

    @Override
    public Integer recordStudyTime(String userId, Integer studyTime) {
        return playerMapper.recordStudyTime(userId, studyTime);
    }

    @Override
    public void recordState(String userId, Integer sectionId, String state) {
        playerMapper.recordState(userId,sectionId,state);
    }

    @Override
    public UserSection readRecord(UserSection userSection) {
        return playerMapper.readRecord(userSection);
    }
}
