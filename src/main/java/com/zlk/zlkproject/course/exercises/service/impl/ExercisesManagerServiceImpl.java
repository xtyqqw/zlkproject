package com.zlk.zlkproject.course.exercises.service.impl;

import com.zlk.zlkproject.course.exercises.mapper.ExercisesManagerMapper;
import com.zlk.zlkproject.course.exercises.service.ExercisesManagerService;
import com.zlk.zlkproject.entity.Exercises;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: zlkproject
 * @description: 练习题业务实现类
 * @author: zyx
 * @create: 2019-12-20 10:59
 */
@Service
public class ExercisesManagerServiceImpl implements ExercisesManagerService {

    @Autowired
    private ExercisesManagerMapper exercisesManagerMapper;

    @Override
    public Integer insertExercises(Exercises exercises) {
        return exercisesManagerMapper.insertExercises(exercises);
    }

    @Override
    public Integer updateExercisesByEId(Exercises exercises) {
        return exercisesManagerMapper.updateExercisesByEId(exercises);
    }

    @Override
    public Integer deleteByEId(Integer eId) {
        return exercisesManagerMapper.deleteByEId(eId);
    }

    @Override
    public List<Exercises> selectAllAndLimit(Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return exercisesManagerMapper.selectAllAndLimit(startPage,limit);
    }

    @Override
    public Integer selectAllCount() {
        return exercisesManagerMapper.selectAllCount();
    }

    @Override
    public List<Exercises> selectByCoursesId(Integer coursesId, Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return exercisesManagerMapper.selectByCoursesId(coursesId,startPage,limit);
    }

    @Override
    public Integer selectCountByCoursesId(Integer coursesId) {
        return exercisesManagerMapper.selectCountByCoursesId(coursesId);
    }

    @Override
    public List<Exercises> selectByChapterId(Integer chapterId, Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return exercisesManagerMapper.selectByChapterId(chapterId,startPage,limit);
    }

    @Override
    public Integer selectCountByChapterId(Integer chapterId) {
        return exercisesManagerMapper.selectCountByChapterId(chapterId);
    }

    @Override
    public List<Exercises> selectBySectionId(Integer sectionId, Integer page, Integer limit) {
        Integer startPage = (page-1)*limit;
        return exercisesManagerMapper.selectBySectionId(sectionId,startPage,limit);
    }

    @Override
    public Integer selectCountBySectionId(Integer sectionId) {
        return exercisesManagerMapper.selectCountBySectionId(sectionId);
    }

    @Override
    public List<Exercises> selectExerciseNumBySectionId(Integer sectionId) {
        return exercisesManagerMapper.selectExerciseNumBySectionId(sectionId);
    }

    @Override
    public Integer selectExerciseCount(Integer sectionId) {
        return exercisesManagerMapper.selectExerciseCount(sectionId);
    }
}
