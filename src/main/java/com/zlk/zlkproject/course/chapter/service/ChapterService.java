package com.zlk.zlkproject.course.chapter.service;

import com.zlk.zlkproject.entity.Chapter;

import java.util.List;

public interface ChapterService {

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
