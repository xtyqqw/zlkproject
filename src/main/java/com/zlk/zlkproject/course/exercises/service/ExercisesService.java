package com.zlk.zlkproject.course.exercises.service;

import com.zlk.zlkproject.entity.Exercises;
import com.zlk.zlkproject.entity.UserAnswer;

import java.util.List;


public interface ExercisesService {
    public Integer recordAnswer(UserAnswer userAnswer);
    public List<Exercises> findExercisesBySectionIdAndUserId(Integer sectionId, String userId);
}
