package com.zlk.zlkproject.course.player.mapper;

import com.zlk.zlkproject.entity.UserSection;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PlayerMapper {
    /**
     *  记录视频观看位置
     *@method recordTime
     *@params [UserSection]
     *@return void
     *@author hry
     *@time 2019/11/25  14:28
     */
    public void recordTime(UserSection userSection);

    /**
     *  读取视频观看位置
     *@method readRecord
     *@params [UserSection]
     *@return Double
     *@author hry
     *@time 2019/11/25  15:46
     */
    public Double readRecord(UserSection userSection);
}
