package com.zlk.zlkproject.community.question.mapper;

import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QuestionTagMapper {
    /*
     * @descrption 通过分类名查询所属标签
     * @author gby
     * @param
     * @return
     * @date 2019/12/3 11:42
     */
    List<Tag> selectTagByTypeId(String tagTypeId);
}
