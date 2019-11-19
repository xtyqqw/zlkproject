package com.zlk.zlkproject.user.personal.service;

import com.zlk.zlkproject.entity.User;

import java.util.List;

public interface DurationService {
    //查询时长和总时长
    List<User> selectDuration(User user);
}
