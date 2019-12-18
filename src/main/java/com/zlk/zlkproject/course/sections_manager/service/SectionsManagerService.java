package com.zlk.zlkproject.course.sections_manager.service;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Section;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.List;

public interface SectionsManagerService {
    public List<Section> findAllData(Integer page,Integer size);
    public List<Section> findDataByCourseId(Integer page,Integer size,Integer courseId);
    public List<Section> findDataByChapterId(Integer page,Integer size,Integer chapterId);
    public Section findDataBySectionId(Integer sectionId);
    public Integer findAllCount();
    public Integer findCountByCourseId(Integer courseId);
    public Integer findCountByChapterId(Integer chapterId);
    public List<Courses> findAllCourseAndChapter();
    public Courses findCourseAndChapterById(Integer courseId);
    public File multipartFileToFile(MultipartFile file);
    public Integer addData(Section section);
    public Integer updateData(Section section);
    public Integer deleteData(Section section);
    public Integer findTimeByChapterId(Integer chapterId);
}
