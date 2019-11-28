package com.zlk.zlkproject.course.section.mapper;

import com.zlk.zlkproject.entity.Section;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface SectionMapper {

    /**
     * 根据课程id查询课程下小节的数量
     * @param courseId 课程id
     * @return 小节数
     */
    Integer findCountByCourseId(Integer courseId);

    /**
     * 根据课程id查询这个课程下的小节
     * @param courseId
     * @return
     */
    List<Section> findSectionByCourseId(Integer courseId);

    /**
     * 根据课程id查询这个课程下的小节并分页
     * @param courseId
     * @param offset
     * @param limit
     * @return 小节集合
     */
    List<Section> findSectionByCourseIdLimit (@Param("courseId")Integer courseId, @Param("offset")Integer offset, @Param("limit")Integer limit);

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

    /**
     * 根据小节id和用户id查询状态
     * @param sectionId
     * @param userId
     * @return
     */
    String findStateByIdAndChapterId(Integer sectionId,Integer userId);

    Section findSectionBySectionIdAndUserId(Integer sectionId,Integer userId);
}
