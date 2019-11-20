package com.zlk.zlkproject.course.section.service;

import com.zlk.zlkproject.entity.Section;

import java.util.List;

public interface SectionService {

    /**
     *  根据章节id查找小节信息
     *@method findSectionByChapterId
     *@params [chapterId]
     *@return java.util.List<com.zlk.zlkproject.entity.Section>
     *@author zhang
     *@time 2019/11/19  14:34
     */
    List<Section> findSectionByChapterId(Integer chapterId);
}
