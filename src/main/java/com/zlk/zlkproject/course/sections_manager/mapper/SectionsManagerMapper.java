package com.zlk.zlkproject.course.sections_manager.mapper;

import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Section;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface SectionsManagerMapper {
    public List<Section> findAllData(Integer page,Integer size);
    public List<Section> findDataByCourseId(Integer page,Integer size,Integer courseId);
    public List<Section> findDataByChapterId(Integer page,Integer size,Integer chapterId);
    public Integer findAllCount();
    public Integer findCountByCourseId(List list);
    public Integer findCountByChapterId(Integer chapterId);
    public List<Courses> findAllCourseAndChapter();
    public Courses findCourseAndChapterById(Integer courseId);
    public Integer addData(Section section);
    public Integer updateData(Section section);
    public Integer deleteData(Section section);
}
