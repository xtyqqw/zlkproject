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
    public Integer updateDataChangeChapter(Section section);
    public Integer deleteData(Section section) throws Exception;
    public Integer findTimeByChapterId(Integer chapterId);
    public Integer changeVideo1(Integer sectionId,String oldPath,String videoAddr1,String videoPath1,Integer videoTime);
    public Integer changeVideo2(Integer sectionId,String oldPath,String videoAddr2,String videoPath2,Integer videoTime);
}
