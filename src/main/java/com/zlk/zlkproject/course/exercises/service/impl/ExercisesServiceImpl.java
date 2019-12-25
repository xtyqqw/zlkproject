package com.zlk.zlkproject.course.exercises.service.impl;

import com.zlk.zlkproject.course.exercises.mapper.ExercisesMapper;
import com.zlk.zlkproject.course.exercises.service.ExercisesService;
import com.zlk.zlkproject.entity.Exercises;
import com.zlk.zlkproject.entity.UserAnswer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisConnectionUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
    @Autowired
    private RedisTemplate<String,String> redisTemplate;

    @Override
    public Integer recordAnswer(UserAnswer userAnswer) {
        /*UserAnswer res = exercisesMapper.findUserAnswer(userAnswer);
        if (res == null){
            return exercisesMapper.addUserAnswer(userAnswer);
        }else {
            return exercisesMapper.updateUserAnswer(userAnswer);
        }*/
        String userId = userAnswer.getUserId();
        Integer sectionId = userAnswer.getSectionId();
        String key = userId + ":" + sectionId;
        String filed = userAnswer.getExerciseNum() + "";
        String value = userAnswer.getAnswer();
        redisTemplate.opsForHash().put(key,filed,value);
        RedisConnectionUtils.unbindConnection(redisTemplate.getConnectionFactory());
        return 1;
    }

    @Override
    public List<Exercises> findExercisesBySectionIdAndUserId(Integer sectionId, String userId) {
        List<Exercises> res = exercisesMapper.findExercisesBySectionIdAndUserId(sectionId, userId);
        String key = userId + ":" + sectionId;
        Map<Object, Object> entries = redisTemplate.opsForHash().entries(key);
        RedisConnectionUtils.unbindConnection(redisTemplate.getConnectionFactory());
        String answer;
        for (Exercises e : res){
            answer = (String) entries.get(e.getExerciseNum() + "");
            e.setUserAnswer(answer);
            e.setUserId(userId);
        }
        return res;
    }
}
