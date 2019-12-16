package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Question;
import com.zlk.zlkproject.entity.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @author gby
 * @ClassName QuestionMapper
 * @description 问答接口
 * @date 2019/12/1 0:40
 */
@Mapper
public interface QuestionMapper {

    /*
     * @descrption 判断用户登录状态
     * @author gby
     * @param
     * @return
     * @date 2019/12/10 11:58
     */

    User findUserById(String userId);

    /*
     * @descrption 提交提问
     * @author gby
     * @param [question]
     * @return com.zlk.zlkproject.entity.Question
     * @date 2019/12/3 11:44
     */
    Integer addQuestion(Question question);

}
