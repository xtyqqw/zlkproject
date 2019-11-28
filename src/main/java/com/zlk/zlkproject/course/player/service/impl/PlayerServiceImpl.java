package com.zlk.zlkproject.course.player.service.impl;

import com.zlk.zlkproject.course.player.mapper.PlayerMapper;
import com.zlk.zlkproject.course.player.service.PlayerService;
import com.zlk.zlkproject.entity.UserSection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        playerMapper.recordTime(userSection);
    }

    @Override
    public Double readRecord(UserSection userSection) {
        return playerMapper.readRecord(userSection);
    }
}
