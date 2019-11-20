package com.zlk.zlkproject.course.chapter.mapper;

import com.zlk.zlkproject.entity.Chapter;
import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface ChapterMapper {

    /**
     *  根据课程id查找章节信息
     *@method findChapterByCoursesId
     *@params [coursesId]
     *@return java.util.List<com.zlk.zlkproject.entity.Chapter>
     *@author zhangyouxin
     *@time 2019/11/19  14:05
     */
    List<Chapter> findChapterByCoursesId(Integer coursesId);
}
