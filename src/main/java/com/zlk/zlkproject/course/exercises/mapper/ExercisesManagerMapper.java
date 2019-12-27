package com.zlk.zlkproject.course.exercises.mapper;

import com.zlk.zlkproject.entity.Exercises;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ExercisesManagerMapper {

    /**
     *  添加习题
     *@method insertExercises
     *@params [exercises]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/20  14:39
     */
    Integer insertExercises(Exercises exercises);

    /**
     *  修改习题
     *@method updateExercisesByEId
     *@params [exercises]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/20  14:42
     */
    Integer updateExercisesByEId(Exercises exercises);

    /**
     *
     *@method deleteByEId
     *@params [eId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/20  14:42
     */
    Integer deleteByEId(Integer eId);

    /**
     *  查找全部并分页
     *@method selectAllAndLimit
     *@params [startPage, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.Exercises>
     *@author zhang
     *@time 2019/12/20  14:42
     */
    List<Exercises> selectAllAndLimit(Integer startPage, Integer limit);

    /**
     *  查找全部数量
     *@method selectAllCount
     *@params []
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/20  14:59
     */
    Integer selectAllCount();

    /**
     *  根据课程查找问题
     *@method selectByCoursesId
     *@params [coursesId, startPage, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.Exercises>
     *@author zhang
     *@time 2019/12/20  16:22
     */
    List<Exercises> selectByCoursesId(Integer coursesId,Integer startPage,Integer limit);

    /**
     *  根据课程查找问题数量
     *@method selectCountByCoursesId
     *@params [coursesId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/20  16:23
     */
    Integer selectCountByCoursesId(Integer coursesId);

    /**
     *  根据章节查找问题
     *@method selectByChapterId
     *@params [chapterId, startPage, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.Exercises>
     *@author zhang
     *@time 2019/12/20  16:22
     */
    List<Exercises> selectByChapterId(Integer chapterId,Integer startPage,Integer limit);

    /**
     *  根据章节查找问题数量
     *@method selectCountByChapterId
     *@params [chapterId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/20  16:23
     */
    Integer selectCountByChapterId(Integer chapterId);

    /**
     *  根据小节查找问题
     *@method selectBySectionId
     *@params [sectionId, startPage, limit]
     *@return java.util.List<com.zlk.zlkproject.entity.Exercises>
     *@author zhang
     *@time 2019/12/20  16:22
     */
    List<Exercises> selectBySectionId(Integer sectionId,Integer startPage,Integer limit);

    /**
     *  根据章节查找问题数量
     *@method selectCountBySectionId
     *@params [sectionId]
     *@return java.lang.Integer
     *@author zhang
     *@time 2019/12/20  16:23
     */
    Integer selectCountBySectionId(Integer sectionId);

    /**
     *  根据小节id查找习题数量
     *@method selectExerciseNumBySectionId
     *@params [sectionId]
     *@return java.util.List<java.lang.Integer>
     *@author zhang
     *@time 2019/12/23  16:27
     */
<<<<<<< HEAD
    List<Integer> selectExerciseNumBySectionId(Integer sectionId);

    /**
     *@Author luanke
     *@Description //查询小节此题数量
     *@Date 10:41 2019/12/26
     *@Param
     *@return
    **/
    Integer selectExerciseCount(Integer sectionId);
=======
    List<Exercises> selectExerciseNumBySectionId(Integer sectionId);

    /**
     * 根据习题Id查询单个记录
     * @param eId
     * @return
     */
    Exercises selectExercisesByEId(Integer eId);
>>>>>>> 1a20b6458aacec3312fc24e1c810fd6ae3fba897
}
