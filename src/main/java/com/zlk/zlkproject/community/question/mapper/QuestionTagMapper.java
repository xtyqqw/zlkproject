package com.zlk.zlkproject.community.question.mapper;

import com.sun.xml.bind.v2.runtime.unmarshaller.TagName;
import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface QuestionTagMapper {
    /*
     * @descrption 通过查询所有标签
     * @author gby
     * @param
     * @return
     * @date 2019/12/3 11:42
     */
    List<Tag> listByTag(Tag tag);
}
