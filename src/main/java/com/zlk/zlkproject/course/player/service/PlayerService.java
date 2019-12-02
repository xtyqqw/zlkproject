package com.zlk.zlkproject.course.player.service;

import com.zlk.zlkproject.entity.UserSection;

public interface PlayerService {
    /**
     *  记录视频观看位置
     *@method recordTime
     *@params [UserSection]
     *@return void
     *@author hry
     *@time 2019/11/25  14:20
     */
    public void recordTime(UserSection userSection);

    /**
     *  读取视频观看位置
     *@method readRecord
     *@params [UserSection]
     *@return Double
     *@author hry
     *@time 2019/11/25  15:43
     */
    public Double readRecord(UserSection userSection);
}
