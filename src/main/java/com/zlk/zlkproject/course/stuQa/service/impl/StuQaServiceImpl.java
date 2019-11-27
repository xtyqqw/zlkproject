package com.zlk.zlkproject.course.stuQa.service.impl;

import com.zlk.zlkproject.course.stuQa.mapper.StuQaMapper;
import com.zlk.zlkproject.course.stuQa.service.StuQaService;
import com.zlk.zlkproject.entity.StuQa;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import sun.plugin2.message.Message;

import java.sql.Array;
import java.util.List;

/**
 * @program: zlkproject
 * @description: 学生问答业务实现类
 * @author: zyx
 * @create: 2019-11-27 15:22
 */
@Service
public class StuQaServiceImpl implements StuQaService {

    @Autowired
    private StuQaMapper stuQaMapper;

    @Override
    @Transactional
    public String insertStuQa(StuQa stuQa, Integer[] tagIdArray) {
        Integer integer = stuQaMapper.insertStuQa(stuQa);
        Integer sqaId = stuQa.getSqaId();
        Integer flag = 0;
        String message;
        for (Integer tagId : tagIdArray) {
            Integer integer1 = stuQaMapper.insertStuQaTag(sqaId, tagId);
            if (integer1>0){
                flag ++;
            }
        }
        if (integer>0 && flag == tagIdArray.length){
            message = "添加成功";
        }else {
            message = "添加失败";
        }
        return message;
    }
}
