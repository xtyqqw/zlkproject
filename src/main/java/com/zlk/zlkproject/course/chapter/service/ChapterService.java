package com.zlk.zlkproject.course.chapter.service;

import com.zlk.zlkproject.entity.Chapter;
import com.zlk.zlkproject.entity.Pagination;

import java.util.List;

public interface ChapterService {

    /**
     * 根据课程id查找对应章节信息
     * @param coursesId
     * @return
     */
    List<Chapter> selectChapterByCoursesId(Integer coursesId);

    /**
     *  根据课程id查找章节信息
     *@method findChapterByCoursesId
     *@params [coursesId]
     *@return java.util.List<com.zlk.zlkproject.entity.Chapter>
     *@author zhangyouxin
     *@time 2019/11/19  14:05
     */
    List<Chapter> findChapterByCoursesId(Integer coursesId);

    /**
     *  添加新章节
     *@method insertChapter
     *@params [chapter]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/5  10:14
     */
    Integer insertChapter(Chapter chapter);

    /**
     *  根据id修改章节
     *@method updateChapterByChapterId
     *@params [chapter]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/5  10:33
     */
    Integer updateChapterByChapterId(Chapter chapter);

    /**
     *  根据id删除章节信息
     *@method deleteByChapterId
     *@params [chapter]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/5  10:34
     */
    Integer deleteByChapterId(Chapter chapter);

    /**
     *  分页查询全部章节
     *@method selectAllAndLimit
     *@params [pagination]
     *@return java.util.List<com.zlk.zlkproject.entity.Chapter>
     *@author zhang
     *@time 2019/12/5  10:35
     */
    List<Chapter> selectAllAndLimit(Pagination pagination);

    /**
     *  根据课程id分页显示
     *@method selectChapterByCoursesIdAndLimit
     *@params [coursesId, page, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.Chapter>
     *@author zhang
     *@time 2019/12/5  10:36
     */
    List<Chapter> selectChapterByCoursesIdAndLimit(Integer coursesId,Integer page,Integer limit);

    /**
     *  查找全部章节数量
     *@method selectAllCount
     *@params []
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/5  11:32
     */
    Integer selectAllCount();

    /**
     *  根据课程查找章节数量
     *@method selectCountByCoursesId
     *@params [coursesId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/5  11:32
     */
    Integer selectCountByCoursesId(Integer coursesId);

    /**
     *  根据章节名称模糊查询
     *@method selectByChapterName
     *@params [chapterName, page, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.Chapter>
     *@author zhang
     *@time 2019/12/5  14:00
     */
    List<Chapter> selectByChapterName(String chapterName,Integer page,Integer limit);

    /**
     *  根据章节名模糊查询的数量
     *@method selectCountsByChapterName
     *@params [chapterName]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/5  14:08
     */
    Integer selectCountsByChapterName(String chapterName);

    /**
     *  根据课程id查找当前课程下的小节数目
     *@method selectSumSectionByCoursesId
     *@params [coursesId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/8  11:46
     */
    Integer selectSumSectionByCoursesId(Integer coursesId);

}
