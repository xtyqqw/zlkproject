package com.zlk.zlkproject.course.section.service;

import com.zlk.zlkproject.entity.Section;

import java.util.List;
import java.util.Map;

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

    /**
     *  根据id查找当前小节状态
     *@method findStateById
     *@params [userId, sectionId]
     *@return java.lang.String
     *@author zhang
     *@time 2019/12/6  14:49
     */
    String findStateById(String userId,Integer sectionId);

    /**
     *  根据小节id查找视频地址
     *@method findVideoAddrById
     *@params [sectionId]
     *@return com.zlk.zlkproject.entity.Section
     *@author zhang
     *@time 2019/11/21  13:40
     */
    Section findVideoAddrById(Integer sectionId);

    /**
     * 根据课程id查询这个课程下的小节并分页
     * @param userId
     * @param courseId
     * @param page
     * @param limit
     * @return 带有课程信息的map
     */
    public Map findSectionByCourseIdLimit(String userId,Integer courseId, Integer page, Integer limit);

    /**
     * 根据课程id查询这个课程下的小节
     * @param courseId
     * @return
     */
    List<Section> findSectionByCourseId(Integer courseId);

    /**
     *  根据sectionId和userId查找section
     *@method findSectionBySectionIdAndUserId
     *@params [sectionId, userId]
     *@return com.zlk.zlkproject.entity.Section
     *@author zhang
     *@time 2019/12/6  14:50
     */
    Section findSectionBySectionIdAndUserId(Integer sectionId,String userId);
}
