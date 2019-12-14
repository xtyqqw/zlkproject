package com.zlk.zlkproject.course.player.mapper;

import com.zlk.zlkproject.entity.UserSection;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;

@Mapper
public interface PlayerMapper {
    /**
     *  记录视频观看位置
     *@method recordTime
     *@params [UserSection,Date]
     *@return void
     *@author hry
     *@time 2019/11/25  14:28
     */
    public void recordTime(@Param("userSection") UserSection userSection, @Param("date") Date date);

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
     *@return Double
     *@author hry
     *@time 2019/11/25  15:46
     */
    public Double readRecord(UserSection userSection);
}
