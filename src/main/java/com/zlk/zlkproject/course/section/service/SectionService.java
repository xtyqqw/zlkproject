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

    String findStateById(Integer userId,Integer sectionId);

    /**
     *  根据小节id查找视频地址
     *@method findVideoAddrById
     *@params [sectionId]
     *@return java.lang.String
     *@author zhang
     *@time 2019/11/21  13:40
     */
    String findVideoAddrById(Integer sectionId);

    Section findSectionBySectionIdAndUserId(Integer sectionId,Integer userId);
}
