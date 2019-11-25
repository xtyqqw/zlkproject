package com.zlk.zlkproject.course.chapter.service.impl;

import com.zlk.zlkproject.course.chapter.mapper.ChapterMapper;
import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.entity.Chapter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: zlkproject
 * @description: 章节业务实现类
 * @author: zyx
 * @create: 2019-11-19 14:08
 */
@Service
public class ChapterServiceImpl implements ChapterService {

    @Autowired
    private ChapterMapper chapterMapper;

    @Override
    public List<Chapter> findChapterByCoursesId(Integer coursesId) {
        return chapterMapper.findChapterByCoursesId(coursesId);
    }
}
