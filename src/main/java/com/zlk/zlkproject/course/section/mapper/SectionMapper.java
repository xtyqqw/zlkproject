package com.zlk.zlkproject.course.section.mapper;

import com.zlk.zlkproject.entity.Section;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface SectionMapper {

    /**
     *  根据章节id查找小节信息
     *@method findSectionByChapterId
     *@params [chapterId]
     *@return java.util.List<com.zlk.zlkproject.entity.Section>
     *@author zhang
     *@time 2019/11/19  14:34
     */
    List<Section> findSectionByChapterId(Integer chapterId);

    String findStateById(Integer sectionId);

    /**
     *  根据小节id查找视频地址
     *@method findVideoAddrById
     *@params [sectionId]
     *@return java.lang.String
     *@author zhang
     *@time 2019/11/21  13:40
     */
    String findVideoAddrById(Integer sectionId);
}
