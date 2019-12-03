package com.zlk.zlkproject.community.question.service;

import com.zlk.zlkproject.entity.Type;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface QuestionTypeService {

    /*
     * @descrption 查询所有分类
     * @author gby
     * @param
     * @return
     * @date 2019/12/3 14:13
     */

    List<Type> selectType(Type type);
}
