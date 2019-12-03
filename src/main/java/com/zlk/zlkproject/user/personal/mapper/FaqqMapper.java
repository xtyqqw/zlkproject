package com.zlk.zlkproject.user.personal.mapper;

import com.zlk.zlkproject.user.entity.MyQuestions;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FaqqMapper {
    /**
     * 查询我的提问相关信息
     * */
    List<MyQuestions> findQuestion(String userId);
}
