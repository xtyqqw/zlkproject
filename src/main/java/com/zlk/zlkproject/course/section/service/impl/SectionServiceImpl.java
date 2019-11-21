package com.zlk.zlkproject.course.section.service.impl;

import com.zlk.zlkproject.course.section.mapper.SectionMapper;
import com.zlk.zlkproject.course.section.service.SectionService;
import com.zlk.zlkproject.entity.Section;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: zlkproject
 * @description: 小节业务实现类
 * @author: zyx
 * @create: 2019-11-19 14:36
 */
@Service
public class SectionServiceImpl implements SectionService {

    @Autowired
    private SectionMapper sectionMapper;

    @Override
    public List<Section> findSectionByChapterId(Integer chapterId) {
        return sectionMapper.findSectionByChapterId(chapterId);
    }

    @Override
    public String findStateById(Integer sectionId) {
        return sectionMapper.findStateById(sectionId);
    }

    @Override
    public String findVideoAddrById(Integer sectionId) {
        return sectionMapper.findVideoAddrById(sectionId);
    }
}
