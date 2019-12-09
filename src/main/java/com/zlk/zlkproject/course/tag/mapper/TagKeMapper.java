package com.zlk.zlkproject.course.tag.mapper;

import com.zlk.zlkproject.entity.Tag;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TagKeMapper {
    List<Tag> findTagList(Tag tag, Integer startPage, Integer limit);
}
