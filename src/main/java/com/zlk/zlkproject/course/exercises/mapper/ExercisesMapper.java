package com.zlk.zlkproject.course.exercises.mapper;

import com.zlk.zlkproject.entity.Exercises;
import com.zlk.zlkproject.entity.UserAnswer;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface ExercisesMapper {
    public UserAnswer findUserAnswer(UserAnswer userAnswer);
    public Integer addUserAnswer(UserAnswer userAnswer);
    public Integer updateUserAnswer(UserAnswer userAnswer);
    public List<Exercises> findExercisesBySectionIdAndUserId(Integer sectionId, String userId);
}
