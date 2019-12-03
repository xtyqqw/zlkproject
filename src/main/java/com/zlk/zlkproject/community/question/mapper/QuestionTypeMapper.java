package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Type;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QuestionTypeMapper {
    /*
     * @descrption 查询所有分类
     * @author gby
     * @param [type]
     * @return java.util.List<com.zlk.zlkproject.entity.Type>
     * @date 2019/12/3 11:40
     */
    List<Type> selectType(Type type);
}
