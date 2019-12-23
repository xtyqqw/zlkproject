package com.zlk.zlkproject.course.exercises.service.impl;

import com.zlk.zlkproject.course.exercises.mapper.ExercisesMapper;
import com.zlk.zlkproject.course.exercises.service.ExercisesService;
import com.zlk.zlkproject.entity.Exercises;
import com.zlk.zlkproject.entity.UserAnswer;
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
public class ExercisesServiceImpl implements ExercisesService {
    @Autowired
    private ExercisesMapper exercisesMapper;
    @Override
    public Integer recordAnswer(UserAnswer userAnswer) {
        UserAnswer res = exercisesMapper.findUserAnswer(userAnswer);
        if (res == null){
            return exercisesMapper.addUserAnswer(userAnswer);
        }else {
            return exercisesMapper.updateUserAnswer(userAnswer);
        }
    }

    @Override
    public List<Exercises> findExercisesBySectionIdAndUserId(Integer sectionId, String userId) {
        return exercisesMapper.findExercisesBySectionIdAndUserId(sectionId,userId);
    }
}
