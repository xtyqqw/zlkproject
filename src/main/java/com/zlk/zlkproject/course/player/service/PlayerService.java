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
     *  记录学习时长
     *@method recordStudyTime
     *@params [String,Integer]
     *@return Integer
     *@author hry
     *@time 2019/12/12  15:45
     */
    public Integer recordStudyTime(String userId, Integer studyTime);

    /**
     *  记录视频观看状态
     *@method recordState
     *@params [String,Integer]
     *@return void
     *@author hry
     *@time 2019/12/09  15:27
     */
    public void recordState(String userId,Integer sectionId,String state);

    /**
     *  读取视频观看位置
     *@method readRecord
     *@params [UserSection]
     *@return UserSection
     *@author hry
     *@time 2019/11/25  15:43
     */
    public UserSection readRecord(UserSection userSection);
}
