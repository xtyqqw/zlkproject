package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Question;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;

/**
 * @author gby
 * @ClassName QuestionMapper
 * @description 问答接口
 * @date 2019/12/1 0:40
 */
@Mapper
public interface QuestionMapper {

    /*
     * @descrption 提交提问
     * @author gby
     * @param [question]
     * @return com.zlk.zlkproject.entity.Question
     * @date 2019/12/3 11:44
     */
    Integer addQuestion(String questionTitle, String questionContent, Date createTime, String typeName, String tagName);

}
