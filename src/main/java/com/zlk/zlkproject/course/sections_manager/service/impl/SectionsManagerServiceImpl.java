package com.zlk.zlkproject.course.sections_manager.service.impl;

import com.zlk.zlkproject.course.sections_manager.mapper.SectionsManagerMapper;
import com.zlk.zlkproject.course.sections_manager.service.SectionsManagerService;
import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Courses;
import com.zlk.zlkproject.entity.Section;
import com.zlk.zlkproject.utils.CommonFileUtil;
import com.zlk.zlkproject.utils.FdfsConfig;
import com.zlk.zlkproject.utils.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
    @Autowired
    private CommonFileUtil commonFileUtil;
    @Autowired
    private FdfsConfig fdfsConfig;

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
    public Section findDataBySectionId(Integer sectionId) {
        return sectionsManagerMapper.findDataBySectionId(sectionId);
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
    @Transactional
    public Integer addData(Section section) {
        Integer sectionsCount = sectionsManagerMapper.findCountByChapterId(section.getChapterId());
        Integer sectionNum = section.getSectionNum();
        Section param = new Section();
        param.setChapterId(section.getChapterId());
        for (int i = sectionsCount;i >= sectionNum;i--){
            param.setLastSectionNum(i+1);
            param.setSectionNum(i);
            sectionsManagerMapper.updateDataLast(param);
        }
        return sectionsManagerMapper.addData(section);
    }

    @Override
    @Transactional
    public Integer updateData(Section section) {
        Integer res = sectionsManagerMapper.updateDataLast(section);
        if (res == 0)
            return res;
        return sectionsManagerMapper.updateData(section);
    }

    @Override
    @Transactional
    public Integer updateDataChangeChapter(Section section) {
        Integer sectionsCount = sectionsManagerMapper.findCountByChapterId(section.getChapterId());
        Integer sectionNum = section.getSectionNum();
        Section param = new Section();
        param.setChapterId(section.getChapterId());
        for (int i = sectionsCount;i >= sectionNum;i--){
            param.setLastSectionNum(i+1);
            param.setSectionNum(i);
            sectionsManagerMapper.updateDataLast(param);
        }

        sectionsCount = sectionsManagerMapper.findCountByChapterId(section.getLastChapterId());
        sectionNum = section.getLastSectionNum();
        param.setChapterId(section.getLastChapterId());
        for (int i = sectionNum;i < sectionsCount;i++){
            param.setLastSectionNum(i);
            param.setSectionNum(i+1);
            sectionsManagerMapper.updateDataLast(param);
        }
        return sectionsManagerMapper.updateDataChangeChapter(section);
    }

    @Override
    @Transactional
    public Integer deleteData(Section section) throws Exception{
        Section section1 = sectionsManagerMapper.findDataBySectionId(section.getSectionId());
        Integer sectionsCount = sectionsManagerMapper.findCountByChapterId(section1.getChapterId());
        Integer sectionNum = section1.getSectionNum();
        Section param = new Section();
        param.setChapterId(section1.getChapterId());
        for (int i = sectionNum;i < sectionsCount;i++){
            param.setLastSectionNum(i);
            param.setSectionNum(i+1);
            sectionsManagerMapper.updateDataLast(param);
        }
        String videoPath1 = section1.getVideoPath1();
        String videoPath2 = section1.getVideoPath2();
        commonFileUtil.deleteFile(videoPath1);
        commonFileUtil.deleteFile(videoPath2);
        return sectionsManagerMapper.deleteData(section);
    }

    @Override
    public Integer findTimeByChapterId(Integer chapterId) {
        return sectionsManagerMapper.findTimeByChapterId(chapterId);
    }

    @Override
    public Integer changeVideo1(Integer sectionId, String oldPath, String videoAddr1, String videoPath1, Integer videoTime) {
        if (!"".equals(oldPath))
            commonFileUtil.deleteFile(oldPath);
        return sectionsManagerMapper.changeVideo1(sectionId,videoAddr1,videoPath1,videoTime);
    }

    @Override
    public Integer changeVideo2(Integer sectionId, String oldPath, String videoAddr2, String videoPath2, Integer videoTime) {
        if (!"".equals(oldPath))
            commonFileUtil.deleteFile(oldPath);
        return sectionsManagerMapper.changeVideo2(sectionId,videoAddr2,videoPath2,videoTime);
    }
}
