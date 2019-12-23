package com.zlk.zlkproject.course.exercises.controller;

import com.zlk.zlkproject.course.exercises.service.ExercisesService;
import com.zlk.zlkproject.entity.Exercises;
import com.zlk.zlkproject.entity.User;
import com.zlk.zlkproject.entity.UserAnswer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("exercises")
public class ExerciseController {
    @Autowired
    private ExercisesService exercisesService;

    @RequestMapping("recordAnswer")
    @ResponseBody
    public Map recordAnswer(UserAnswer userAnswer, HttpServletRequest request){
        Map map = new HashMap();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null){
            map.put("retmsg","用户登录异常！请重新登录");
            return map;
        }
        userAnswer.setUserId(user.getUserId());
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        if (sectionId == null){
            map.put("retmsg","小节ID获取异常！请重新登录");
            return map;
        }
        userAnswer.setSectionId(sectionId);
        Integer res = exercisesService.recordAnswer(userAnswer);
        map.put("res",res);
        return map;
    }

    @RequestMapping("readExercisesAndAnswer")
    @ResponseBody
    public Map readExercisesAndAnswer(HttpServletRequest request){
        Map map = new HashMap();
        User user = (User) request.getSession().getAttribute("user");
        if (user == null){
            map.put("retmsg","用户登录异常！请重新登录");
            return map;
        }
        String userId = user.getUserId();
        Integer sectionId = (Integer) request.getSession().getAttribute("sectionId");
        if (sectionId == null){
            map.put("retmsg","小节ID获取异常！请重新登录");
            return map;
        }
        List<Exercises> res = exercisesService.findExercisesBySectionIdAndUserId(sectionId, userId);
        map.put("res",res);
        return map;
    }
}
