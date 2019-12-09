package com.zlk.zlkproject.course.sections_manager.service.impl;

import com.zlk.zlkproject.course.sections_manager.mapper.SectionsManagerMapper;
import com.zlk.zlkproject.course.sections_manager.service.SectionsManagerService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Section;
import com.zlk.zlkproject.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Service
public class SectionsManagerServiceImpl implements SectionsManagerService {
    @Autowired
    private SectionsManagerMapper sectionsManagerMapper;

    @Override
    public List<Section> findAllData(Integer page, Integer size) {
        page = (page - 1) * size;
        return sectionsManagerMapper.findAllData(page, size);
    }

    @Override
    public List<Section> findDataByCourseId(Integer page, Integer size, Integer courseId) {
        /*page = (page - 1) * size;
        Courses courses = sectionsManagerMapper.findCourseAndChapterById(courseId);
        List<Integer> list = new ArrayList<>();
        for(Chapter c:courses.getChapterList()){
            list.add(c.getChapterId());
        }
        if (list.size() == 0){
            return new ArrayList<>();
        }
        List<Section> res = sectionsManagerMapper.findDataByCourseId(page, size, list);
        return res;*/

        page = (page - 1) * size;
        List<Section> list = sectionsManagerMapper.findDataByCourseId(page, size, courseId);
        return list;
    }

    @Override
    public List<Section> findDataByChapterId(Integer page, Integer size, Integer chapterId) {
        page = (page - 1) * size;
        return sectionsManagerMapper.findDataByChapterId(page,size,chapterId);
    }

    @Override
    public Integer findAllCount() {
        return sectionsManagerMapper.findAllCount();
    }

    @Override
    public Integer findCountByCourseId(Integer courseId) {
        Courses courses = sectionsManagerMapper.findCourseAndChapterById(courseId);
        List<Integer> list = new ArrayList<>();
        for(Chapter c:courses.getChapterList()){
            list.add(c.getChapterId());
        }
        if (list.size() == 0){
            return 0;
        }
        Integer res = sectionsManagerMapper.findCountByCourseId(list);
        return res;
    }

    @Override
    public Integer findCountByChapterId(Integer chapterId) {
        return sectionsManagerMapper.findCountByChapterId(chapterId);
    }

    @Override
    public List<Courses> findAllCourseAndChapter() {
        return sectionsManagerMapper.findAllCourseAndChapter();
    }

    @Override
    public Courses findCourseAndChapterById(Integer courseId) {
        return sectionsManagerMapper.findCourseAndChapterById(courseId);
    }

    @Override
    public File multipartFileToFile(MultipartFile file) {
        File f = null;
        if(file.equals("")||file.getSize()<=0){
            file = null;
        }else{
            InputStream ins = null;
            try {
                ins = file.getInputStream();
            } catch (IOException e) {
                e.printStackTrace();
            }
            f=new File(file.getOriginalFilename());
            FileUtil.inputStreamToFile(ins, f);
        }

        return f;
    }

    @Override
    public Integer addData(Section section) {
        return sectionsManagerMapper.addData(section);
    }

    @Override
    public Integer updateData(Section section) {
        return sectionsManagerMapper.updateData(section);
    }

    @Override
    public Integer deleteData(Section section) {
        return sectionsManagerMapper.deleteData(section);
    }
}
