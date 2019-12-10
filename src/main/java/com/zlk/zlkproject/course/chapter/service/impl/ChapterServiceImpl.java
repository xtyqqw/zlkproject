package com.zlk.zlkproject.course.chapter.service.impl;

import com.zlk.zlkproject.course.chapter.mapper.ChapterMapper;
import com.zlk.zlkproject.course.chapter.service.ChapterService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
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
    public List<Chapter> selectChapterByCoursesId(Integer coursesId) {
        return chapterMapper.selectChapterByCoursesId(coursesId);
    }

    @Override
    public List<Chapter> findChapterByCoursesId(Integer coursesId) {
        return chapterMapper.findChapterByCoursesId(coursesId);
    }

    @Override
    public Integer insertChapter(Chapter chapter) {
        return chapterMapper.insertChapter(chapter);
    }

    @Override
    public Integer updateChapterByChapterId(Chapter chapter) {
        return chapterMapper.updateChapterByChapterId(chapter);
    }

    @Override
    public Integer deleteByChapterId(Chapter chapter) {
        return chapterMapper.deleteByChapterId(chapter);
    }

    @Override
    public List<Chapter> selectAllAndLimit(Pagination pagination) {
        Integer page = pagination.getPage();
        Integer limit = pagination.getLimit();
        Integer startPage = (page-1)*limit;
        pagination.setStartPage(startPage);
        return chapterMapper.selectAllAndLimit(pagination);
    }

    @Override
    public List<Chapter> selectChapterByCoursesIdAndLimit(Integer coursesId, Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return chapterMapper.selectChapterByCoursesIdAndLimit(coursesId, startPage, limit);
    }

    @Override
    public Integer selectAllCount() {
        return chapterMapper.selectAllCount();
    }

    @Override
    public Integer selectCountByCoursesId(Integer coursesId) {
        return chapterMapper.selectCountByCoursesId(coursesId);
    }

    @Override
    public List<Chapter> selectByChapterName(String chapterName, Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return chapterMapper.selectByChapterName(chapterName, startPage, limit);
    }

    @Override
    public Integer selectCountsByChapterName(String chapterName) {
        return chapterMapper.selectCountsByChapterName(chapterName);
    }

    @Override
    public Integer selectSumSectionByCoursesId(Integer coursesId) {
        return chapterMapper.selectSumSectionByCoursesId(coursesId);
    }
}
